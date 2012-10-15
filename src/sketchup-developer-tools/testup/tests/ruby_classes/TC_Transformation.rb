# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API Transformation object.
#
# This file was originally generated by ourdoc.rb, an internal tool we developed
# specifically for outputting support files (documentation, unit tests, etc.)
# from the standard, doxygen-style c++ comments that are embedded into the
# Ruby implementation files. You can find ourdoc.rb alongside these
# implementation files at:
#
# googleclient/sketchup/source/sketchup/ruby
#

require 'test/unit'

# TC_Transformation contains unit tests for the Transformation class.
#
# API Object::       Transformation
# C++ File::         rtransformation.cpp
# Parent Class::     Object
# Version::          SketchUp 6.0
#
# The transformation class serves two purposes. First, the transformation
# class allows you to initially place geometry in a 3d space, such as when
# placing a component instance within the draw area.  Second, and foremost,
# the transformation class can be used to apply transformations on geometry,
# such as a move (called a translation), rotate, or scale of geometry (just as
# you might move, rotate, and scale geometry within the SketchUp user
# interface). Use of the transformation class require a knowledge of
# geometrical transformations in 3 dimensions which is covered extensively on
# the Internet.
#
class TC_Transformation < Test::Unit::TestCase

  # Setup for test cases, if required.
  #
  def setup
    def UI::messagebox(params)
      puts 'TESTUP OVERRIDE: UI::messagebox > ' + params.to_s
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.inverse
  # @file                rtransformation.cpp
  #
  # The inverse method is used to retrieve the inverse of a
  # transformation.
  #
  #
  # Args:
  #
  # Returns:
  # - transformation2: the Transformation object at its
  # inverse.
  #

  # Test the example code that we have in the API documentation.
  def test_inverse_api_example
    transformation1 = Geom::Transformation.new
    assert_nothing_raised do
     transformation2 = transformation1.inverse
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.translation
  # @file                rtransformation.cpp
  #
  # The translation method is used to create a transformation that does
  # translation.
  #
  #
  # Args:
  # - vector: A Vector3d object.
  #
  # Returns:
  # - transformation: a new Transformation object
  #

  # Test the example code that we have in the API documentation.
  def test_translation_api_example
    
    assert_nothing_raised do
     vector = Geom::Vector3d.new 0,1,0
     t = Geom::Transformation.translation vector
     UI.messagebox t
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.to_a
  # @file                rtransformation.cpp
  #
  # The to_a method retrieves a 16 element array which contains the values
  # that define the Transformation.
  #
  #
  # Args:
  #
  # Returns:
  # - array: an Array element containing the values that
  # define the transformation
  #

  # Test the example code that we have in the API documentation.
  def test_to_a_api_example
    
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     a = t.to_a
     UI.messagebox a
    end
  end


  # Test that the entities method returns an Array object.
  def test_to_a_returns_array
    obj = Geom::Transformation.new
    a = obj.to_a
    result = a.class
    expected = Array
    assert_equal(expected, result, 'Expected does not match result.')
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.scaling
  # @file                rtransformation.cpp
  #
  # The scaling method is used to create a Transformation that does
  # scaling.
  #
  # - t = Geom::Transformation.scaling scale
  # - t = Geom::Transformation.scaling xscale, yscale, zscale
  # - t = Geom::Transformation.scaling point, scale
  # - t = Geom::Transformation.scaling point, xscale, yscale, zscale
  #
  # - With one argument, it does a uniform scale about the origin.
  # - With two arguments, it does a uniform scale about an arbitrary
  # point.
  # - With three arguments, it does a non-uniform scale about the origin.
  # - With four arguments it does a non-uniform scale about an arbitrary
  # point.
  #
  #
  # Args:
  # - scale: A single numeric value used to set a global scale factor for
  # the transform.
  # - xscale: (optional) A numeric value specifying the scale factor in
  # the x direction for the transform.
  # - yscale: (optional) A numeric value specifying the scale factor in
  # the y direction for the transform.
  # - zscale: (optional) A numeric value specifying the scale factor in
  # the z direction for the transform.
  # - point: A Point3d object.
  #
  # Returns:
  # - transformation: a new Transformation object
  #

  # Test the example code that we have in the API documentation.
  def test_scaling_api_example
    assert_nothing_raised do
     t = Geom::Transformation.scaling 10
     UI.messagebox t
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.yaxis
  # @file                rtransformation.cpp
  #
  # The yaxis method retrieves the y axis of a rigid transformation.
  #
  #
  # Args:
  #
  # Returns:
  # - point: a Point3d object containing the yaxis value.
  #

  # Test the example code that we have in the API documentation.
  def test_yaxis_api_example
    
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     y = t.yaxis
     UI.messagebox y
    end

  end


  # Test that the yaxis method returns a Vector3d object.
  def test_yaxis_returns_vector3d
    obj = Geom::Transformation.new
    v = obj.yaxis
    result = v.class
    expected = Geom::Vector3d
    assert_equal(expected, result, 'Expected does not match result.')
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.axes
  # @file                rtransformation.cpp
  #
  # The axes method creates a Transformation that goes from world
  # coordinates to an arbitrary coordinate system defined by an origin and
  # three axis vectors.
  #
  #
  # Args:
  # - origin: A Point3d object.
  # - xaxis: A Vector3d object.
  # - yaxis: A Vector3d object.
  # - zaxis: A Vector3d object.
  #
  # Returns:
  # - transformation: a new Transformation object
  #

  # Test the example code that we have in the API documentation.
  def test_axes_api_example
    origin = Geom::Point3d.new(1,0,0)
    xaxis = Geom::Vector3d.new(1,0,0)
    yaxis = Geom::Vector3d.new(0,1,0)
    zaxis = Geom::Vector3d.new(0,1,1)
    assert_nothing_raised do
     t = Geom::Transformation.axes origin, xaxis, yaxis, zaxis
     UI.messagebox t
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.zaxis
  # @file                rtransformation.cpp
  #
  # The yaxis method retrieves the z axis of a rigid transformation.
  #
  #
  # Args:
  #
  # Returns:
  # - point: a Point3d object containing the yaxis value.
  #

  # Test the example code that we have in the API documentation.
  def test_zaxis_api_example
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     z = t.zaxis
     UI.messagebox z
    end
  end


  # Test that the zaxis method returns a Vector3d object.
  def test_zaxis_returns_vector3d
    obj = Geom::Transformation.new
    v = obj.zaxis
    result = v.class
    expected = Geom::Vector3d
    assert_equal(expected, result, 'Expected does not match result.')
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.origin
  # @file                rtransformation.cpp
  #
  # The origin method retrieves the origin of a rigid transformation.
  #
  #
  # Args:
  #
  # Returns:
  # - point: a Point3d object representing the origin of the
  # transformation.
  #

  # Test the example code that we have in the API documentation.
  def test_origin_api_example
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     point2 = t.origin
     UI.messagebox point2
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.set!
  # @file                rtransformation.cpp
  #
  # The set! method is used to set this transformation to match another
  # one.
  #
  # The argument is anything that can be converted into a Transformation.
  #
  #
  # Args:
  # - transform2: A Transformation object to match.
  #
  # Returns:
  # - transformation1: a Transformation object matching
  # transform2
  #

  # Test the example code that we have in the API documentation.
  def test_set_inplace_api_example
    transformation1 = Geom::Transformation.new
    transformation2 = Geom::Transformation.new
    assert_nothing_raised do
     transformation1 = transformation1.set! transformation2
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.*
  # @file                rtransformation.cpp
  #
  # The * method is used to do matrix multiplication using the Transform.
  #
  #
  # Args:
  # - point1: A Point3d, Vector3d, or Transformation object.
  #
  # Returns:
  # - transformation: a new Transformation object.
  #

  # Test the example code that we have in the API documentation.
  def test_multiply_api_example
    
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     point2 = Geom::Point3d.new 2,2,2
     t = Geom::Transformation.new point
     point3 = t * point2
     UI.messagebox point3
    end

  end



  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.invert!
  # @file                rtransformation.cpp
  #
  # The invert! method sets the transformation to its inverse.
  #
  #
  # Args:
  #
  # Returns:
  # - transformation: the Transformation object at its
  # inverse.
  #

  # Test the example code that we have in the API documentation.
  def test_invert_inplace_api_example
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     t2 = t.invert!
     UI.messagebox t2
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.clone
  # @file                rtransformation.cpp
  #
  # The clone method is used to create a copy of a transformation.
  #
  #
  # Args:
  #
  # Returns:
  # - transformation2: a new Transformation object (clone of
  # transformation1)
  #

  # Test the example code that we have in the API documentation.
  def test_clone_api_example
    
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     t2 = t.clone
     UI.messagebox t2
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.rotation
  # @file                rtransformation.cpp
  #
  # The rotation method is used to create a Transformation that does
  # rotation about an axis.
  #
  # The axis is defined by a point and a vector. The angle is given in
  # radians.
  #
  #
  # Args:
  # - point: A Point3d object.
  # - vector: A Vector3d object.
  # - angle: A numeric value, expressed in radians, that specifies the
  # angle to rotate about the axis set by the second parameter.
  #
  # Returns:
  # - transformation: a new Transformation object
  #

  # Test the example code that we have in the API documentation.
  def test_rotation_api_example
    point = Geom::Point3d.new(1,0,0)
    vector = Geom::Vector3d.new(1,0,0)
    angle = 1.0
    assert_nothing_raised do
     transformation = Geom::Transformation.rotation point, vector, angle
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.xaxis
  # @file                rtransformation.cpp
  #
  # The xaxis method retrieves the x axis of a rigid transformation.
  #
  #
  # Args:
  #
  # Returns:
  # - point: a Point3d object containing the xaxis value.
  #

  # Test the example code that we have in the API documentation.
  def test_xaxis_api_example
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     x = t.xaxis
     UI.messagebox x
    end
  end


  # Test that the xaxis method returns a Vector3d object.
  def test_xaxis_returns_vector3d
    obj = Geom::Transformation.new
    v = obj.xaxis
    result = v.class
    expected = Geom::Vector3d
    assert_equal(expected, result, 'Expected does not match result.')
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.new
  # @file                rtransformation.cpp
  #
  # The new method is used to create a new transformation.
  #
  # You can use this method or one of the more specific methods for
  # creating specific kinds of Transformations.
  #
  # Geom::Transformation.new with no arguments creates a new identify
  # Transformation.
  #
  # Geom::Transformation.new(pt) creates a Transformation that translates
  # the origin to pt.
  #
  # Geom::Transformation.new(vec) creates a Transformation that
  # translates by vector vec.
  #
  # Geom::Transformation.new(transform) creates a Transformation that is
  # a copy of another Transformation. This is equivalent to
  # transform.clone.
  #
  # Geom::Transformation.new(array) creates a Transformation from a 16
  # element Array.
  #
  # Geom::Transformation.new(scale) creates a Transformation that does
  # uniform scaling.
  #
  # Geom::Transformation.new(origin, zaxis) creates a Transformation
  # where origin is the new origin, and zaxis is the z axis. The x and y
  # axes are determined using an arbitrary axis rule.
  #
  # Geom::Transformation.new(pt, xaxis, yaxis) creates a Transformation
  # given a new origin, x axis and y axis.
  #
  # Geom::Transformation.new(pt, axis, angle) creates a Transformation
  # that rotates by angle (given in radians) about a line defined by pt
  # and axis.
  #
  # Geom::Transformation.new(xaxis, yaxis, zaxis, origin) creates a
  # Transformation from 3 axes and an origin.
  #
  #
  # Args:
  # - param1: (optional) A Point3d, Vector3d, Transformation, Array, or
  # Float, depending on the kind of transformation you wish to create (see
  # comments)
  # - param2: (optional) An axis (see comments)
  # - param3: (optional) An axis or angle (see comments)
  #
  # Returns:
  # - tranformation: a new Transformation object
  #

  # Test the example code that we have in the API documentation.
  def test_new_api_example
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     if (t)
       UI.messagebox t
     else
       UI.messagebox "Failure"
     end
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.identity?
  # @file                rtransformation.cpp
  #
  # The identity? method is used to determine if a transformation is the
  # identity transform.
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if the transformation is the identity
  # transform, false if it is not the identity transform.
  #

  # Test the example code that we have in the API documentation.
  def test_identity_api_example
    
    assert_nothing_raised do
     point = Geom::Point3d.new 10,20,30
     t = Geom::Transformation.new point
     status = t.identity?
     UI.messagebox status
    end

  end



  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Transformation.interpolate
  # @file                rtransformation.cpp
  #
  # The interpolate method is used to create a new transformation that is
  # the result of interpolating between two other transformations.
  #
  # Parameter is a percent (between 0 and 1) that identifies whether to
  # favor transformation1 or transformation2.
  #
  #
  # Args:
  # - transform1: A Transformation object.
  # - transform2: A Transformation object.
  # - parameter: A value between 0 and 1 (see comments).
  #
  # Returns:
  # - transformation3: the new Transformation object
  #

  # Test the example code that we have in the API documentation.
  def test_interpolate_api_example
    
    assert_nothing_raised do
     origin = Geom::Point3d.new 0,0,0
     x = Geom::Vector3d.new 0,1,0
     y = Geom::Vector3d.new 1,0,0
     z = Geom::Vector3d.new 0,0,1
     point = Geom::Point3d.new 10,20,30
     t1 = Geom::Transformation.new point
     t2 = Geom::Transformation.axes origin, x, y, z
     t3 = Geom::Transformation.interpolate t1, t2, 25
     UI.messagebox t3
    end

  end



end