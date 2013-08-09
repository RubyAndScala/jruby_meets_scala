import sbt._
import Keys._

object JRubyMeetsScalaBuild extends Build {
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
      writeClasspathTask
    )
  )
}