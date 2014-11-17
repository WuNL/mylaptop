"""autogenerated by genpy from inertial/NCOM.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class NCOM(genpy.Message):
  _md5sum = "61d8ee5f52d2961d53ecbc0a568e7bdd"
  _type = "inertial/NCOM"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header
#batch1
uint16 time
float32 accelerationX
float32 accelerationY
float32 accelerationZ
float32 angularRateX
float32 angularRateY
float32 angularRateZ
uint8 navStatus
#bath2
float64 latitude
float64 longitude
float32 altitude
float32 velocityNorth
float32 velocityEast
float32 velocityDown
float32 heading
float32 pitch
float32 roll

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
  __slots__ = ['header','time','accelerationX','accelerationY','accelerationZ','angularRateX','angularRateY','angularRateZ','navStatus','latitude','longitude','altitude','velocityNorth','velocityEast','velocityDown','heading','pitch','roll']
  _slot_types = ['std_msgs/Header','uint16','float32','float32','float32','float32','float32','float32','uint8','float64','float64','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,time,accelerationX,accelerationY,accelerationZ,angularRateX,angularRateY,angularRateZ,navStatus,latitude,longitude,altitude,velocityNorth,velocityEast,velocityDown,heading,pitch,roll

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(NCOM, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.time is None:
        self.time = 0
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
      if self.navStatus is None:
        self.navStatus = 0
      if self.latitude is None:
        self.latitude = 0.
      if self.longitude is None:
        self.longitude = 0.
      if self.altitude is None:
        self.altitude = 0.
      if self.velocityNorth is None:
        self.velocityNorth = 0.
      if self.velocityEast is None:
        self.velocityEast = 0.
      if self.velocityDown is None:
        self.velocityDown = 0.
      if self.heading is None:
        self.heading = 0.
      if self.pitch is None:
        self.pitch = 0.
      if self.roll is None:
        self.roll = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.time = 0
      self.accelerationX = 0.
      self.accelerationY = 0.
      self.accelerationZ = 0.
      self.angularRateX = 0.
      self.angularRateY = 0.
      self.angularRateZ = 0.
      self.navStatus = 0
      self.latitude = 0.
      self.longitude = 0.
      self.altitude = 0.
      self.velocityNorth = 0.
      self.velocityEast = 0.
      self.velocityDown = 0.
      self.heading = 0.
      self.pitch = 0.
      self.roll = 0.

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
      buff.write(_struct_H6fB2d7f.pack(_x.time, _x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.navStatus, _x.latitude, _x.longitude, _x.altitude, _x.velocityNorth, _x.velocityEast, _x.velocityDown, _x.heading, _x.pitch, _x.roll))
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
      end += 71
      (_x.time, _x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.navStatus, _x.latitude, _x.longitude, _x.altitude, _x.velocityNorth, _x.velocityEast, _x.velocityDown, _x.heading, _x.pitch, _x.roll,) = _struct_H6fB2d7f.unpack(str[start:end])
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
      buff.write(_struct_H6fB2d7f.pack(_x.time, _x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.navStatus, _x.latitude, _x.longitude, _x.altitude, _x.velocityNorth, _x.velocityEast, _x.velocityDown, _x.heading, _x.pitch, _x.roll))
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
      end += 71
      (_x.time, _x.accelerationX, _x.accelerationY, _x.accelerationZ, _x.angularRateX, _x.angularRateY, _x.angularRateZ, _x.navStatus, _x.latitude, _x.longitude, _x.altitude, _x.velocityNorth, _x.velocityEast, _x.velocityDown, _x.heading, _x.pitch, _x.roll,) = _struct_H6fB2d7f.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3I = struct.Struct("<3I")
_struct_H6fB2d7f = struct.Struct("<H6fB2d7f")
