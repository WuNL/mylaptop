/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg
 *
 */


#ifndef MAPPING_DLUT_MESSAGE_GRID_H
#define MAPPING_DLUT_MESSAGE_GRID_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mapping_dlut
{
template <class ContainerAllocator>
struct Grid_
{
  typedef Grid_<ContainerAllocator> Type;

  Grid_()
    : fAvgElevation(0.0)
    , proability(0)
    , texture(0)  {
    }
  Grid_(const ContainerAllocator& _alloc)
    : fAvgElevation(0.0)
    , proability(0)
    , texture(0)  {
    }



   typedef float _fAvgElevation_type;
  _fAvgElevation_type fAvgElevation;

   typedef int8_t _proability_type;
  _proability_type proability;

   typedef int8_t _texture_type;
  _texture_type texture;




  typedef boost::shared_ptr< ::mapping_dlut::Grid_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mapping_dlut::Grid_<ContainerAllocator> const> ConstPtr;

}; // struct Grid_

typedef ::mapping_dlut::Grid_<std::allocator<void> > Grid;

typedef boost::shared_ptr< ::mapping_dlut::Grid > GridPtr;
typedef boost::shared_ptr< ::mapping_dlut::Grid const> GridConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mapping_dlut::Grid_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mapping_dlut::Grid_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mapping_dlut

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'mapping_dlut': ['/home/wunl/catkin_ws/src/mapping_dlut/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mapping_dlut::Grid_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mapping_dlut::Grid_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mapping_dlut::Grid_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mapping_dlut::Grid_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mapping_dlut::Grid_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mapping_dlut::Grid_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mapping_dlut::Grid_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d1e632170b3f559b23311a8f8cc60632";
  }

  static const char* value(const ::mapping_dlut::Grid_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd1e632170b3f559bULL;
  static const uint64_t static_value2 = 0x23311a8f8cc60632ULL;
};

template<class ContainerAllocator>
struct DataType< ::mapping_dlut::Grid_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mapping_dlut/Grid";
  }

  static const char* value(const ::mapping_dlut::Grid_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mapping_dlut::Grid_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#Header header\n\
#maximum elevation in this grid;\n\
#float32 fMaxElevation\n\
#minimum elevation in this grid;\n\
#float32 fMinElevation\n\
#average elevation in this grid;\n\
#float32 fAvgElevation\n\
#points falling in this grid;\n\
#int32 nPointCount\n\
#up point falling in this grid;\n\
#int32 nUpCount\n\
#down point falling in this grid;\n\
#int32 nDownCount\n\
\n\
\n\
#average elevation in this grid;\n\
float32 fAvgElevation\n\
#proability\n\
int8 proability\n\
#texture\n\
int8 texture\n\
";
  }

  static const char* value(const ::mapping_dlut::Grid_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mapping_dlut::Grid_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.fAvgElevation);
      stream.next(m.proability);
      stream.next(m.texture);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Grid_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mapping_dlut::Grid_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mapping_dlut::Grid_<ContainerAllocator>& v)
  {
    s << indent << "fAvgElevation: ";
    Printer<float>::stream(s, indent + "  ", v.fAvgElevation);
    s << indent << "proability: ";
    Printer<int8_t>::stream(s, indent + "  ", v.proability);
    s << indent << "texture: ";
    Printer<int8_t>::stream(s, indent + "  ", v.texture);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAPPING_DLUT_MESSAGE_GRID_H