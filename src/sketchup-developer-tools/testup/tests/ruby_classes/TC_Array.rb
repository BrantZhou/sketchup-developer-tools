# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API Array object.
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

# TC_Array contains unit tests for the Array class.
#
# API Object::       Array
# C++ File::         rgeom.cpp
# Parent Class::     Object
# Version::          SketchUp 6.0
#
# The SketchUp Array class adds additional methods to the standard Ruby Array
# class. Namely the SketchUp Ruby Array class contains methods allowing an
# array to behave just as Vector3d or  Point3d objects (which are arrays of 3
# coordinate values). Therefore, you can use the Array class in place of a
# Point3d or Vector3d as a way to pass coordinate values.
#
#
class TC_Array < Test::Unit::TestCase

  # Turn off messageboxes, since our API examples in this class are lousy
  # with 'em.
  #
  def setup
    def UI::messagebox(params)
      puts 'TESTUP OVERRIDE: UI::messagebox > ' + params.to_s
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.cross
  # @file                rgeom.cpp
  #
  # The cross method is used to compute the cross product between two
  # vectors.
  #
  #
  #
  # Args:
  # - vector: The Vector object used to compute the cross product.
  #
  # Returns:
  # - vector2: a Vector3d object if successful
  #

  # Test the example code that we have in the API documentation.
  def test_cross_api_example
    v = nil
    assert_nothing_raised do
     vector = Geom::Vector3d.new 0,1,0
     a = [1,0,0]
     v = a.cross vector
     if (v)
       UI.messagebox v
     else
       UI.messagebox "Failure"
     end
    end
    expected_vector = Geom::Vector3d.new 0,0,1
    assert_equal(expected_vector, v,
                 'Failed in test_cross' )
  end

  # Test edgecases for values passed to this method.
  def test_cross_edgecases
    # TODO(scottlininger): There are surely a pile of edge cases with cross
    # products that need tests written against them. I'm not boned up on
    # the math, though, so skipping for now.
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.project_to_plane
  # @file                rgeom.cpp
  #
  # The project_to_plane method retrieves the projection of a Point3d
  # object onto a plane.
  #
  # See the Geom module for instructions on how to create a plane.
  #
  #
  # Args:
  # - plane: The plane used to determine the projection from.
  #
  # Returns:
  # - point: a new Point3d object that is the point on the
  # plane that is closest to this plane (if successful)
  #

  # Test the example code that we have in the API documentation.
  def test_project_to_plane_api_example
    pointonplane = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [10,10,10]
     pointonplane = a.project_to_plane plane
    end
    expected_point = Geom::Point3d.new 10, 10, 0
    assert_equal(expected_point, pointonplane,
                 'Failed in test_project_to_plane' )
  end

  # Test what happens when the point to project is already on the
  # plane -- should return itself.
  def test_project_to_plane_with_point_already_on_plane
    pointonplane = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [5,5,0]
     pointonplane = a.project_to_plane plane
    end
    expected_point = Geom::Point3d.new 5, 5, 0
    assert_equal(expected_point, pointonplane,
                 'Point on plane did not project to self.' )
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.offset
  # @file                rgeom.cpp
  #
  # The offset method is used to offset a point by a vector.
  #
  #
  # Args:
  # - vector1: A Vector3d object used to offset the point.
  #
  # Returns:
  # - : status
  #

  # Test the example code that we have in the API documentation.
  def test_offset_api_example
    point2 = nil
    assert_nothing_raised do
     a = [10,10,10]
     vector = Geom::Vector3d.new(0,0,1)
     point2 = a.offset! vector
    end
    expected_point = Geom::Point3d.new 10,10,11
    assert_equal(expected_point, point2,
                 'Failed in test_offset' )
  end
  
  # Test the offset if it is zero length vector
  def test_offset_zero_length_vector
    point2 = nil
    assert_nothing_raised do
     a = [10,10,10]
     vector = Geom::Vector3d.new(0,0,0)
     point2 = a.offset! vector
    end
    expected_point = Geom::Point3d.new 10,10,10
    assert_equal(expected_point, point2,
                 'Failed with 0 length offset' )
  end

  # Test the offset in all three axes.
  def test_offset_all_axes
    point2 = nil
    assert_nothing_raised do
     a = [10,10,10]
     vector = Geom::Vector3d.new(2.123,4.567,7.890)
     point2 = a.offset! vector
    end
    expected_point = Geom::Point3d.new 12.123,14.567,17.890
    assert_equal(expected_point, point2,
                 'Failed with 3-axes offset' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.transform
  # @file                rgeom.cpp
  #
  # The transform! method is used to apply a Transformation object to a
  # Point3d object defined by an Array object.
  #
  # This method modifies the Point3d object
  #
  #
  # Args:
  # - transformation: A Transformation object.
  #
  # Returns:
  # - : status
  #

  # Test the example code that we have in the API documentation.
  def test_transform_api_example
    point3 = nil
    assert_nothing_raised do
     point2 = Geom::Point3d.new 100,200,300
     transform = Geom::Transformation.new(point2)
     a = [10,10,10]
     point3 = a.transform! transform
    end
    expected_point = Geom::Point3d.new 110,210,310
    assert_equal(expected_point, point3,
                 'Failed in test_transform' )
  end
  
  # Test that a neutral transform won't move the point.
  def test_transform_by_nothing
    point3 = nil
    assert_nothing_raised do
     point2 = Geom::Point3d.new 0,0,0
     transform = Geom::Transformation.new(point2)
     a = [10,10,10]
     point3 = a.transform! transform
    end
    expected_point = Geom::Point3d.new 10,10,10
    assert_equal(expected_point, point3,
                 'Failed transforming by nothing' )
  end

  # TODO(scottlininger): There are several other kinds of transformations
  # we could be testing here, such as rotations and scales.


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.dot
  # @file                rgeom.cpp
  #
  # The dot method is used to compute the dot product between two vectors
  #
  #
  #
  # Args:
  # - vector: A Vector3d object used to compute the dot product.
  #
  # Returns:
  # - dot: the dot product if successful
  #

  # Test the example code that we have in the API documentation.
  def test_dot_api_example
    d = nil
    assert_nothing_raised do
     vector = Geom::Vector3d.new 0,1,0
     a = [1,0,0]
     d = a.dot vector
    end
    expected_dot = 0.0
    assert_equal(expected_dot, d,
                 'Failed in test_dot' )
  end

  # Test edgecases for values passed to this method.
  def test_dot_edgecases
    # TODO(scottlininger): I'm sure that there are a bunch of edge cases
    # with dot products that should be tested, but I need to do some research.
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.z=
  # @file                rgeom.cpp
  #
  # The z= method sets the z coordinate.
  #
  #
  # Args:
  # - z: The new z position.
  #
  # Returns:
  # - z: the new z coordinate if successful
  #

  # Test the example code that we have in the API documentation.
  def test_set_z_api_example
    a = nil
    assert_nothing_raised do
     a = [1,2,3]
     a.z = 5
    end
    assert_equal(5, a.z,
                 'Failed in test_set_z' )
  end

  # Test edgecases for values passed to this method.
  def test_set_z_edgecases
    a = [1,2,3]
    a.z = 0
    assert_equal(0, a.z, 'Failed in test_set_z_edgecases, 0' )
    a.z = -5
    assert_equal(-5, a.z, 'Failed in test_set_z_edgecases, -5' )
    a.z = 5
    assert_equal(5, a.z, 'Failed in test_set_z_edgecases, 5' )
    a.z = 100.999
    assert_equal(100.999, a.z, 'Failed in test_set_z_edgecases, 100.999' )
    a.z = -100.999
    assert_equal(-100.999, a.z, 'Failed in test_set_z_edgecases, -100.999' )
  end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  def test_set_z_bad_params
    a = [1,2,3]
    a.z = "scott"
    assert_equal('scott', a.z, 'Failed in test_set_z_bad_params, "scott"' )
    a.z = nil
    assert_equal(nil, a.z, 'Failed in test_set_z_bad_params, nil' )
    a.z = Sketchup.active_model
    assert_equal(Sketchup.active_model, a.z,
                 'Failed in test_set_z_bad_params, Sketchup.active_model' )
  end

  # Test that the z= method successfully sets a float value.
  def test_set_z_as_float
    obj = Array.new
    obj.z = 1000.0
    result = obj.z
    expected = 1000.0
    assert_equal(expected, result, 'expected does not match result.')
  end

  # Test that the z= method successfully sets a fiznum value.
  def test_set_z_as_fixnum
    obj = Array.new
    obj.z = 1000
    result = obj.z
    expected = 1000
    assert_equal(expected, result, 'expected does not match result.')
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.distance_to_line
  # @file                rgeom.cpp
  #
  # The distance_to_line method is used to compute the distance from a
  # Point3d object to a line. Lines are defined by an array of a point and
  # a vector or an array of two points. See also the Geom class.
  #
  #
  #
  # Args:
  # - line: An array with a Point3d object and a Vector3d object if
  # successful. See the Geom module for further information on lines.
  #
  # Returns:
  # - distance: the distance if successful
  #

  # Test the example code that we have in the API documentation.
  def test_distance_to_line_api_example
    distance = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [10,10,10]
     distance = a.distance_to_line line
    end
    expected_distance = 14.142135623731.to_l
    assert_equal(expected_distance, distance,
                 'Failed in test_distance_to_line' )
  end

  # Test that a distance of 0 is returned if we're already on the line.
  def test_distance_to_line_when_already_on_line
    distance = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [0,0,500]
     distance = a.distance_to_line line
    end
    expected_distance = 0.0.to_l
    assert_equal(expected_distance, distance,
                 'Failed in test_distance_to_line' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.on_plane?
  # @file                rgeom.cpp
  #
  # The on_plane? method is used to determine if a Point3d object is on a
  # plane (to within tolerance).
  #
  # See the Geom module for instructions on how to create a plane.
  #
  #
  # Args:
  # - plane: The plane of the Point3d .
  #
  # Returns:
  # - success: true if successful, false if unsuccessful.
  #

  # Test the example code that we have in the API documentation.
  def test_on_plane_api_example
    status = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [10,10,10]
     status = a.on_plane? plane
    end
    assert_equal(false, status,
                 'Failed in test_on_plane' )
  end

  # Test that true is returned as well.
  def test_on_plane_true
    status = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [887,123.123,0]
     status = a.on_plane? plane
    end
    assert_equal(true, status,
                 'on_plane returned incorrect result' )
  end
  
  # Test that false is returned as well with minor miss.
  def test_on_plane_false
    status = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [887,123.123,0.001]
     status = a.on_plane? plane
    end
    assert_equal(false, status,
                 'on_plane returned incorrect result' )
  end

  # Test that true is returned with a minor miss smaller than our
  # 3-decimal point tolerance.
  def test_on_plane_tolerance
    status = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [887,123.123,0.0001]
     status = a.on_plane? plane
    end
    assert_equal(true, status,
                 'on_plane returned incorrect result' )
  end

  # Test that true is returned for point on the origin and with
  # weird inputs to the array.
  def test_on_plane_true_from_at_origin
    status = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [0.0.to_i,0.0.to_f,0.0.to_l]
     status = a.on_plane? plane
    end
    assert_equal(true, status,
                 'on_plane returned incorrect result' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.distance
  # @file                rgeom.cpp
  #
  # The distance method is used to compute the distance between two
  # points.
  #
  #
  # Args:
  # - point: The Point3d object used to compute the distance.
  #
  # Returns:
  # - distance: the distance if successful
  #

  # Test the example code that we have in the API documentation.
  def test_distance_api_example
    distance = nil
    assert_nothing_raised do
     point1 = Geom::Point3d.new 10,10,10
     a = [1,1,1]
     distance = a.distance point1
    end
    expected_distance = 15.5884572681199.to_l
    assert_equal(expected_distance, distance,
                 'Failed in test_distance' )
  end

  # Test that zero is returned if they are the same point.
  def test_distance_of_zero
    distance = nil
    assert_nothing_raised do
     point1 = Geom::Point3d.new 10,10,10
     a = [10,10,10]
     distance = a.distance point1
    end
    expected_distance = 0.0.to_l
    assert_equal(expected_distance, distance,
                 'Failed in test_distance_of_zero' )
  end

  # Test that zero is returned if they are the same point within tolerance
  # of 3 decimal points.
  def test_distance_of_zero_within_tolerance
    distance = nil
    assert_nothing_raised do
     point1 = Geom::Point3d.new 10,10,10.0001
     a = [10,10,10]
     distance = a.distance point1
    end
    expected_distance = 0.0.to_l
    assert_equal(expected_distance, distance,
                 'Failed in test_distance_of_zero_within_tolerance' )
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.y=
  # @file                rgeom.cpp
  #
  # The y= method sets the y coordinate.
  #
  #
  # Args:
  # - y: The new y position.
  #
  # Returns:
  # - y: the new y coordinate if successful
  #

  # Test the example code that we have in the API documentation.
  def test_set_y_api_example
    a = nil
    assert_nothing_raised do
     a = [1,2,3]
     a.y = 5
    end
    assert_equal(5, a.y,
                 'Failed in test_set_y' )
  end

  # Test edgecases for values passed to this method.
  def test_set_y_edgecases
    a = [1,2,3]
    a.y = 0
    assert_equal(0, a.y, 'Failed in test_set_y_edgecases, 0' )
    a.y = -5
    assert_equal(-5, a.y, 'Failed in test_set_y_edgecases, -5' )
    a.y = 5
    assert_equal(5, a.y, 'Failed in test_set_y_edgecases, 5' )
    a.y = 100.999
    assert_equal(100.999, a.y, 'Failed in test_set_y_edgecases, 100.999' )
    a.y = -100.999
    assert_equal(-100.999, a.y, 'Failed in test_set_y_edgecases, -100.999' )
  end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  def test_set_y_bad_params
    a = [1,2,3]
    a.y = "scott"
    assert_equal('scott', a.y, 'Failed in test_set_y_bad_params, "scott"' )
    a.y = nil
    assert_equal(nil, a.y, 'Failed in test_set_y_bad_params, nil' )
    a.y = Sketchup.active_model
    assert_equal(Sketchup.active_model, a.y,
                 'Failed in test_set_y_bad_params, Sketchup.active_model' )
  end

  # Test that the y= method successfully sets a float value.
  def test_set_y_as_float
    obj = Array.new
    obj.y = 1000.0
    result = obj.y
    expected = 1000.0
    assert_equal(expected, result, 'expected does not match result.')
  end

  # Test that the y= method successfully sets a fiynum value.
  def test_set_y_as_fixnum
    obj = Array.new
    obj.y = 1000
    result = obj.y
    expected = 1000
    assert_equal(expected, result, 'expected does not match result.')
  end
  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.x
  # @file                rgeom.cpp
  #
  # The x method retrieves the x coordinate.
  #
  #
  # Args:
  #
  # Returns:
  # - x: the x coordinate if successful
  #

  # Note that this method is more thoroughly tested in the set_x tests as well.

  # Test the example code that we have in the API documentation.
  def test_x_api_example
    a = nil
    assert_nothing_raised do
     a = [1,2,3]
     x = a.x
    end
    assert_equal(1, a.x,
                 'Failed in test_x' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.on_line?
  # @file                rgeom.cpp
  #
  # The on_line? method is used to determine if a Point3d object is on a
  # line
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if the point is on the line, false if the
  # point is not on the line.
  #

  # Test the example code that we have in the API documentation.
  def test_on_line_api_example
    status = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [10,10,10]
     status = a.on_line? line
    end
    assert_equal(false, status,
                 'Failed in test_on_line' )
  end

    # Test that true is returned as well.
  def test_on_line_true
    status = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [0,0,124.456]
     status = a.on_line? line
    end
    assert_equal(true, status,
                 'on_line returned incorrect result' )
  end
  
  # Test that false is returned as well with minor miss.
  def test_on_line_false
    status = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [887,123.123,0.001]
     status = a.on_line? line
    end
    assert_equal(false, status,
                 'on_line returned incorrect result' )
  end

  # Test that true is returned with a minor miss smaller than our
  # 3-decimal point tolerance.
  def test_on_line_tolerance
    status = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [0,0,0.0001]
     status = a.on_line? line
    end
    assert_equal(true, status,
                 'on_line returned incorrect result' )
  end

  # Test that true is returned for point on the origin and with
  # weird inputs to the array.
  def test_on_line_true_from_at_origin
    status = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [0.0.to_i,0.0.to_f,0.0.to_l]
     status = a.on_line? line
    end
    assert_equal(true, status,
                 'on_line returned incorrect result' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.y
  # @file                rgeom.cpp
  #
  # The y method retrieves the y coordinate.
  #
  #
  # Args:
  #
  # Returns:
  # - y: the y coordinate if successful
  #

  # Note that this method is more thoroughly tested in the set_y tests as well.

  # Test the example code that we have in the API documentation.
  def test_y_api_example
    y = nil
    assert_nothing_raised do
     a = [1,2,3]
     y = a.y
    end
    assert_equal(2, y,
                 'Failed in test_y' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.x=
  # @file                rgeom.cpp
  #
  # The x= method sets the x coordinate.
  #
  #
  # Args:
  # - x: The new x position.
  #
  # Returns:
  # - x: the new x coordinate if successful
  #

  # Test the example code that we have in the API documentation.
  def test_set_x_api_example
    a = nil
    assert_nothing_raised do
     a = [1,2,3]
     a.x = 5
    end
    assert_equal(5, a.x,
                 'Failed in test_set_x' )
  end

  # Test edgecases for values passed to this method.
  def test_set_x_edgecases
    a = [1,2,3]
    a.x = 0
    assert_equal(0, a.x, 'Failed in test_set_x_edgecases, 0' )
    a.x = -5
    assert_equal(-5, a.x, 'Failed in test_set_x_edgecases, -5' )
    a.x = 5
    assert_equal(5, a.x, 'Failed in test_set_x_edgecases, 5' )
    a.x = 100.999
    assert_equal(100.999, a.x, 'Failed in test_set_x_edgecases, 100.999' )
    a.x = -100.999
    assert_equal(-100.999, a.x, 'Failed in test_set_x_edgecases, -100.999' )
  end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  def test_set_x_bad_params
    a = [1,2,3]
    a.x = "scott"
    assert_equal('scott', a.x, 'Failed in test_set_x_bad_params, "scott"' )
    a.x = nil
    assert_equal(nil, a.x, 'Failed in test_set_x_bad_params, nil' )
    a.x = Sketchup.active_model
    assert_equal(Sketchup.active_model, a.x,
                 'Failed in test_set_x_bad_params, Sketchup.active_model' )
  end

  # Test that the x= method successfully sets a float value.
  def test_set_x_as_float
    obj = Array.new
    obj.x = 1000.0
    result = obj.x
    expected = 1000.0
    assert_equal(expected, result, 'expected does not match result.')
  end

  # Test that the x= method successfully sets a fiznum value.
  def test_set_x_as_fixnum
    obj = Array.new
    obj.x = 1000
    result = obj.x
    expected = 1000
    assert_equal(expected, result, 'expected does not match result.')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.z
  # @file                rgeom.cpp
  #
  # The z method retrieves the z coordinate.
  #
  #
  # Args:
  #
  # Returns:
  # - z: the z coordinate if successful
  #

  # Note that this method is more thoroughly tested in the set_z tests as well.

  # Test the example code that we have in the API documentation.
  def test_z_api_example
    z = nil
    assert_nothing_raised do
     a = [1,2,3]
     z = a.z
    end
    assert_equal(3, z,
                 'Failed in test_z' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.distance_to_plane
  # @file                rgeom.cpp
  #
  # The distance_to_plane method is used to compute the distance from a
  # Point3d object to a plane.
  #
  #
  #
  # Args:
  # - plane: A plane used to compute the distance. See the Geom module for
  # further information on planes.
  #
  # Returns:
  # - distance: the distance if successful
  #

  # Test the example code that we have in the API documentation.
  def test_distance_to_plane_api_example
    distance = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [10,10,10]
     distance = a.distance_to_plane plane
    end
    assert_equal(10, distance,
                 'Failed in test_distance_to_plane' )
  end

  # Test that a distance of 0 is returned if we're already on the plane.
  def test_distance_to_plane_when_already_on_plane
    distance = nil
    assert_nothing_raised do
     plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [500,1000,0]
     distance = a.distance_to_plane plane
    end
    expected_distance = 0.0.to_l
    assert_equal(expected_distance, distance,
                 'Failed in test_distance_to_plane' )
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.normalize
  # @file                rgeom.cpp
  #
  # The normalize! method is used to normalize a vector in place (setting
  # its length to 1).
  #
  # The arguments and return value will be converted to a floating point
  # value (unlike in the Vector3d.normalize!).
  #
  #
  # Args:
  #
  # Returns:
  # - vector: a Vector3d object if successful
  #

  # Test the example code that we have in the API documentation.
  def test_normalize_api_example
    v = nil
    assert_nothing_raised do
     a = [0,0,1]
     v = a.normalize!
    end
    result_vector = Geom::Vector3d.new v
    assert_equal(1.0, result_vector.length,
                 'Failed in test_normalize' )
  end

  # Make sure that it does something with a vector of a longer length.
  def test_normalize_with_longer_vector
    v = nil
    assert_nothing_raised do
     a = [100.7,6049,10]
     v = a.normalize!
    end
    result_vector = Geom::Vector3d.new v
    assert_equal(1.0, result_vector.length,
                 'Failed in test_normalize_with_longer_vector' )
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.vector_to
  # @file                rgeom.cpp
  #
  # The transform! method is used to create an array as a vector from one
  # point to a second point.
  #
  #
  # Args:
  # - point: A Point3d object representing the second point.
  #
  # Returns:
  # - vector: a Vector3d object if successful
  #

  # Test the example code that we have in the API documentation.
  def test_vector_to_api_example
    vector = nil
    assert_nothing_raised do
     point2 = Geom::Point3d.new 100,200,300
     a = [10,10,10]
     vector = a.vector_to point2
    end
    expected_vector = Geom::Vector3d.new 90.0, 190.0, 290.0
    assert_equal(expected_vector, vector,
                 'Failed in test_vector_to' )
  end

  # Test that a zero-length vector is returned if they are the same point.
  def test_vector_with_same_points
    vector = nil
    assert_nothing_raised do
     point2 = Geom::Point3d.new 100,200,300
     a = [100,200,300]
     vector = a.vector_to point2
    end
    expected_vector = Geom::Vector3d.new 0, 0, 0
    assert_equal(expected_vector, vector,
                 'Failed in test_vector_with_same_points' )
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Array.project_to_line
  # @file                rgeom.cpp
  #
  # The project_to_line method is used to retrieve the projection of a
  # Point3d object onto a line.
  #
  #
  # Args:
  # - line: An array with a Point3d object and a Vector3d object.
  #
  # Returns:
  # - point: a new Point3d object that is the point on the
  # line that is closest to this point (if successful)
  #

  # Test the example code that we have in the API documentation.
  def test_project_to_line_api_example
    pointonline = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [10,10,10]
     pointonline = a.project_to_line line
    end
    puts pointonline.to_a.to_s
    expected_point = Geom::Point3d.new 0,0,10
    assert_equal(expected_point, pointonline,
                 'Failed in test_project_to_line' )
  end

  # Test what happens when the point to project is already on the
  # line -- should return itself.
  def test_project_to_line_with_point_already_on_line
    pointonline = nil
    assert_nothing_raised do
     line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
     a = [0,0,5]
     pointonline = a.project_to_line line
    end
    expected_point = Geom::Point3d.new 0, 0, 5
    assert_equal(expected_point, pointonline,
                 'Point on line did not project to self.' )
  end

end