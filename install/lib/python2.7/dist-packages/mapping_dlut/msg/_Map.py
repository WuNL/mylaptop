"""autogenerated by genpy from mapping_dlut/Map.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import mapping_dlut.msg
import std_msgs.msg

class Map(genpy.Message):
  _md5sum = "e6ab6c8862bf55f4e1b5fd48f03f1a7d"
  _type = "mapping_dlut/Map"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header
###########################################################
#Elevation Map Configuration
#half size of the map;
int32 nHalfSize
#Elevation Grid Resolution, in meter;
float32 fResolution
#x coordinate of the center of the map in world frame
float32 fCenterX
#y coordinate of the center of the map in world frame
float32 fCenterY
#maximum elevation of the map in world frame
float32 fMapMaxElevation
#minimum elevation of the map in world frame
float32 fMapMinElevation
###########################################################

###########################################################
#Vehicle Status
#vehicle x in world frame, in meters
float32 fVehicleX
#vehicle y in world frame, in meters
float32 fVehicleY
#vehicle z in world frame, in meters
float32 fVehicleZ
#vehicle heading angle, in rad
float32 fVehicleHeading
###########################################################
Grid[] map

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

================================================================================
MSG: mapping_dlut/Grid
#Header header
#maximum elevation in this grid;
#float32 fMaxElevation
#minimum elevation in this grid;
#float32 fMinElevation
#average elevation in this grid;
#float32 fAvgElevation
#points falling in this grid;
#int32 nPointCount
#up point falling in this grid;
#int32 nUpCount
#down point falling in this grid;
#int32 nDownCount


#average elevation in this grid;
float32 fAvgElevation
#proability
int8 proability
#texture
int8 texture

"""
  __slots__ = ['header','nHalfSize','fResolution','fCenterX','fCenterY','fMapMaxElevation','fMapMinElevation','fVehicleX','fVehicleY','fVehicleZ','fVehicleHeading','map']
  _slot_types = ['std_msgs/Header','int32','float32','float32','float32','float32','float32','float32','float32','float32','float32','mapping_dlut/Grid[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,nHalfSize,fResolution,fCenterX,fCenterY,fMapMaxElevation,fMapMinElevation,fVehicleX,fVehicleY,fVehicleZ,fVehicleHeading,map

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Map, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.nHalfSize is None:
        self.nHalfSize = 0
      if self.fResolution is None:
        self.fResolution = 0.
      if self.fCenterX is None:
        self.fCenterX = 0.
      if self.fCenterY is None:
        self.fCenterY = 0.
      if self.fMapMaxElevation is None:
        self.fMapMaxElevation = 0.
      if self.fMapMinElevation is None:
        self.fMapMinElevation = 0.
      if self.fVehicleX is None:
        self.fVehicleX = 0.
      if self.fVehicleY is None:
        self.fVehicleY = 0.
      if self.fVehicleZ is None:
        self.fVehicleZ = 0.
      if self.fVehicleHeading is None:
        self.fVehicleHeading = 0.
      if self.map is None:
        self.map = []
    else:
      self.header = std_msgs.msg.Header()
      self.nHalfSize = 0
      self.fResolution = 0.
      self.fCenterX = 0.
      self.fCenterY = 0.
      self.fMapMaxElevation = 0.
      self.fMapMinElevation = 0.
      self.fVehicleX = 0.
      self.fVehicleY = 0.
      self.fVehicleZ = 0.
      self.fVehicleHeading = 0.
      self.map = []

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
      buff.write(_struct_i9f.pack(_x.nHalfSize, _x.fResolution, _x.fCenterX, _x.fCenterY, _x.fMapMaxElevation, _x.fMapMinElevation, _x.fVehicleX, _x.fVehicleY, _x.fVehicleZ, _x.fVehicleHeading))
      length = len(self.map)
      buff.write(_struct_I.pack(length))
      for val1 in self.map:
        _x = val1
        buff.write(_struct_f2b.pack(_x.fAvgElevation, _x.proability, _x.texture))
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
      if self.map is None:
        self.map = None
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
      end += 40
      (_x.nHalfSize, _x.fResolution, _x.fCenterX, _x.fCenterY, _x.fMapMaxElevation, _x.fMapMinElevation, _x.fVehicleX, _x.fVehicleY, _x.fVehicleZ, _x.fVehicleHeading,) = _struct_i9f.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.map = []
      for i in range(0, length):
        val1 = mapping_dlut.msg.Grid()
        _x = val1
        start = end
        end += 6
        (_x.fAvgElevation, _x.proability, _x.texture,) = _struct_f2b.unpack(str[start:end])
        self.map.append(val1)
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
      buff.write(_struct_i9f.pack(_x.nHalfSize, _x.fResolution, _x.fCenterX, _x.fCenterY, _x.fMapMaxElevation, _x.fMapMinElevation, _x.fVehicleX, _x.fVehicleY, _x.fVehicleZ, _x.fVehicleHeading))
      length = len(self.map)
      buff.write(_struct_I.pack(length))
      for val1 in self.map:
        _x = val1
        buff.write(_struct_f2b.pack(_x.fAvgElevation, _x.proability, _x.texture))
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
      if self.map is None:
        self.map = None
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
      end += 40
      (_x.nHalfSize, _x.fResolution, _x.fCenterX, _x.fCenterY, _x.fMapMaxElevation, _x.fMapMinElevation, _x.fVehicleX, _x.fVehicleY, _x.fVehicleZ, _x.fVehicleHeading,) = _struct_i9f.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.map = []
      for i in range(0, length):
        val1 = mapping_dlut.msg.Grid()
        _x = val1
        start = end
        end += 6
        (_x.fAvgElevation, _x.proability, _x.texture,) = _struct_f2b.unpack(str[start:end])
        self.map.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_f2b = struct.Struct("<f2b")
_struct_3I = struct.Struct("<3I")
_struct_i9f = struct.Struct("<i9f")
