"""autogenerated by genpy from transformation/VehiclePose.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class VehiclePose(genpy.Message):
  _md5sum = "a0541797f46aeae2f6afb0486ce01bf1"
  _type = "transformation/VehiclePose"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header
float32 accelerationX
float32 accelerationY
float32 accelerationZ

float32 angularRateX
float32 angularRateY
float32 angularRateZ

float64 latitude
float64 longitude
float32 altitude

float32 velocityX
float32 velocityY
float32 velocityZ

float32 heading
float32 pitch
float32 roll

float32 x
float32 y
float32 z


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

"""
  __slots__ = ['header','accelerationX','accelerationY','accelerationZ','angularRateX','angularRateY','angularRateZ','latitude','longitude','altitude','velocityX','velocityY','velocityZ','heading','pitch','roll','x','y','z']
  _slot_types = ['std_msgs/Header','float32','float32','float32','float32','float32','float32','float64','float64','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,accelerationX,accelerationY,accelerationZ,angularRateX,angularRateY,angularRateZ,latitude,longitude,altitude,velocityX,velocityY,velocityZ,heading,pitch,roll,x,y,z

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(VehiclePose, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.accelerationX is None:
        self.accelerationX = 0.
      if self.accelerationY is None:
        self.accelerationY = 0.
      if self.accelerationZ is None:
        self.accelerationZ = 0.
      if self.angularRateX is None:
        self.angularRateX = 0.
      if self.angularRateY is None:
        self.angularRateY = 0.
      if self.angularRateZ is None:
        self.angularRateZ = 0.
      if self.latitude is None:
        self.latitude = 0.
      if self.longitude is None:
        self.longitude = 0.
      if self.altitude is None:
        self.altitude = 0.
      if self.velocityX is None:
        self.velocityX = 0.
      if self.velocityY is None:
        self.velocityY = 0.
      if self.velocityZ is None:
        self.velocityZ = 0.
      if self.heading is None:
        self.heading = 0.
      if self.pitch is None:
        self.pitch = 0.
      if self.roll is None:
        self.roll = 0.
      if self.x is None:
        self.x = 0.
      if self.y is None:
        self.y = 0.
      if self.z is None:
        self.z = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.accelerationX = 0.
      self.accelerationY = 0.
      self.accelerationZ = 0.
      self.angularRateX = 0.
      self.angularRateY = 0.
      self.angularRateZ = 0.
      self.latitude = 0.
      self.longitude = 0.
      self.altitude = 0.
      self.velocityX = 0.
      self.velocityY = 0.
      self.velocityZ = 0.
      self.heading = 0.
      self.pitch = 0.
      self.roll = 0.
      self.x = 0.
      self.y = 0.
      self.z = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_6f2d10f.pack(_x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.latitude, _x.longitude, _x.altitude, _x.velocityX, _x.velocityY, _x.velocityZ, _x.heading, _x.pitch, _x.roll, _x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 80
      (_x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.latitude, _x.longitude, _x.altitude, _x.velocityX, _x.velocityY, _x.velocityZ, _x.heading, _x.pitch, _x.roll, _x.x, _x.y, _x.z,) = _struct_6f2d10f.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_6f2d10f.pack(_x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.latitude, _x.longitude, _x.altitude, _x.velocityX, _x.velocityY, _x.velocityZ, _x.heading, _x.pitch, _x.roll, _x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 80
      (_x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.latitude, _x.longitude, _x.altitude, _x.velocityX, _x.velocityY, _x.velocityZ, _x.heading, _x.pitch, _x.roll, _x.x, _x.y, _x.z,) = _struct_6f2d10f.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3I = struct.Struct("<3I")
_struct_6f2d10f = struct.Struct("<6f2d10f")
