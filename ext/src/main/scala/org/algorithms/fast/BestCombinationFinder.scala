package org.algorithms.fast

import cc.abstra.scuby._
import JRuby._
import scala.collection.JavaConverters._
import org.jruby.{RubyObject => JRubyObject}
import java.util.{List => JList}

class BestCombinationFinder(_qualityMeasure: JRubyObject) {
  type Elements = java.util.List[java.util.List[Any]]
  val qualityMeasure = _qualityMeasure.as[JList[Any] => Double]
  def combinations(elements:Elements) = {
    new Combinations(elements.asScala.map(_.asScala), qualityMeasure)
  }
  class Combinations(elements:Seq[Seq[Any]], qualityMeasure: JList[Any] => Double) {
    def best = all.asScala.maxBy(x => qualityMeasure(x))
    def all = {
      val empty: List[List[Any]] = List(List())
      val asList:List[List[Any]] = elements.toList.map(_.toList)
      asList.foldRight(empty)(crossProduct _).map(_.asJava).asJava
    }
    def crossProduct(xs:List[Any], zss: List[List[Any]]):List[List[Any]] = {
      for {
        x <- xs
        zs <- zss
      } yield(x :: zs)
    }
  }
}
