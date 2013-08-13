import sbt._
import Keys._

object JRubyMeetsScalaBuild extends Build {
  lazy val dist = TaskKey[Unit](
    "dist", "Copies files from target to dist."
  )
  lazy val distTask =
    dist <<= (
      name, scalaVersion, version, update, crossTarget,
      packageBin in Compile
    ).map {
      case (
        projectName, scalaVersion, projectVersion, updateReport, out,
        _
      ) =>
        val dist = (out / ".." / ".." / "dist").getAbsoluteFile
        // Clean up dist dir.
        IO.delete(dist)

        // Copy packaged jar.
        IO.copyFile(
          out / "%s_%s-%s.jar".format(
            projectName.toLowerCase, CrossVersion.binaryScalaVersion(scalaVersion), projectVersion
          ),
          dist / "jruby_meets_scala.jar"
        )
    }

  val writeClasspath = TaskKey[Unit]("write-classpath")
  val writeClasspathTask = writeClasspath <<= (target, fullClasspath in Runtime) map { (target, cp) =>
    val f = (target / ".classpath").asFile
    IO.write(f, cp.map(_.data).mkString(":"))
  }
  lazy val main = Project(
    id = "root",
    base = file("."),
    settings = Project.defaultSettings ++ Seq(
      scalaVersion := "2.10.2",
      distTask,
      writeClasspathTask
    )
  )
}