package org.algorithms.fast

import cc.abstra.scuby._
import JRuby._
import scala.collection.JavaConverters._
import org.jruby.{RubyObject => JRubyObject}
import java.util.{List => JList}

class BestCombinationFinder(_qualityMeasure: JRubyObject) {

  type Elements = Seq[Seq[Any]]

  val qualityMeasure = _qualityMeasure.as[Seq[Any] => Double]

  def combinations(elements:Elements) = {
    new Combinations(elements, qualityMeasure)
  }

  class Combinations(elements:Elements, qualityMeasure: Seq[Any] => Double) {

    def crossProduct(xs:List[Any], zss: List[List[Any]]):List[List[Any]] = {
      for {
        x <- xs
        zs <- zss
      } yield(x :: zs)
    }

    def all = {
      val empty: List[List[Any]] = List(List())
      val asList:List[List[Any]] = elements.toList.map(_.toList)
      asList.foldRight(empty)(crossProduct _)
    }

    def best = all.maxBy(x => qualityMeasure(x))
  }
}
