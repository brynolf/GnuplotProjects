<?xml version="1.0" encoding="utf-8"?>
<MICE Version="1.0.4.0" Timestamp="2018-06-13 14:20:52.8385138" ID="F3C1FdaB3cDF05fd" Name="prostReg">
  <Nodes>
    <Node ID="BA548EBbBce23bE6" T="NodeMaskCustom" V="0.1" X="393" Y="323" FI="Center X (mm);Center Y (mm);Center Z (mm);">
      <Inputs>
        <IO ID="0f6C04Ff43F03d5F" T="Image4DFloat" N="Reference" MI="1" MA="1" />
        <IO ID="47bF41B7CcD3C74f" T="Double" N="Center X (mm)" MI="1" MA="1" />
        <IO ID="ebeD2A68bc8F76fF" T="Double" N="Center Y (mm)" MI="1" MA="1" />
        <IO ID="cFeC1E5DDc0d67da" T="Double" N="Center Z (mm)" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="fd10CADe1F3EbCf7" T="Image4DBool" N="Result" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Shape" V="Box" />
        <SN N="SX" V="200" />
        <SN N="SY" V="100" />
        <SN N="SZ" V="50" />
        <SN N="CX" V="-0.00299999999997169" />
        <SN N="CY" V="-24.493" />
        <SN N="CZ" V="-7.1148" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="0Cd6D1BA5f54dcb7" T="NodeReadDicomDB" V="0.1" X="42" Y="264" FI="">
      <Inputs />
      <Outputs>
        <IO ID="763b63E461BB21c5" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="SeriesID" V="60586" />
        <SN N="DateOffset" V="0" />
        <SN N="MatchString" V="Fast SPGR+GD" />
        <SN N="IgnoreBatch" V="False" />
        <SN N="SetNewName" V="False" />
        <SN N="NewName" V="" />
        <SN N="Modality" V="MR" />
        <SN N="StructSeriesIDs" V="" />
        <SN N="RegSeriesIDs" V="" />
        <SN N="Connection" V="MIQA;v01s654\miqa;miqa2016;" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="fE4DEe4d3fbb4Bbe" T="NodeImageToDouble" V="0.1" X="191" Y="337" FI="">
      <Inputs>
        <IO ID="f8C1bDEfEE0d7bbF" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="Fa147BAfDb606BcF" T="Double" N="Center Position X" MI="1" MA="1" />
        <IO ID="C2DdbCbBb1b08A3c" T="Double" N="Center Position Y" MI="1" MA="1" />
        <IO ID="77D08C34dbbCAD0f" T="Double" N="Center Position Z" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="PX" V="False" />
        <SN N="PY" V="False" />
        <SN N="PZ" V="False" />
        <SN N="CPX" V="True" />
        <SN N="CPY" V="True" />
        <SN N="CPZ" V="True" />
        <SN N="SX" V="False" />
        <SN N="SY" V="False" />
        <SN N="SZ" V="False" />
        <SN N="ST" V="False" />
        <SN N="SXr" V="False" />
        <SN N="SYr" V="False" />
        <SN N="SZr" V="False" />
        <SN N="STr" V="False" />
        <SN N="VSX" V="False" />
        <SN N="VSY" V="False" />
        <SN N="VSZ" V="False" />
        <SN N="MVV" V="False" />
        <SN N="MIVV" V="False" />
        <SN N="MAVV" V="False" />
        <SN N="VVSUM" V="False" />
        <SN N="VVSD" V="False" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="FCE1eb4EbcD214aE" T="NodeIORepeater" V="0.1" X="340" Y="297" FI="">
      <Inputs>
        <IO ID="57163B12e48F23bc" T="Image4DFloat" N="In" MI="1" MA="2147483647" />
      </Inputs>
      <Outputs>
        <IO ID="788FC0Ab42AEbd51" T="Image4DFloat" N="Out" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Desc" V="" />
        <SN N="Sim" V="False" />
        <SN N="SetNewName" V="False" />
        <SN N="IOType" V="Mice.Types.Image4DFloat" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="cbA8AAfe44CCbe4B" T="NodeExtractFrames" V="0.1" X="189" Y="277" FI="">
      <Inputs>
        <IO ID="8BC0Cc513441d78F" T="Image4DFloat" N="Time Series" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="aA314Dbf0Fbbbc1b" T="Image4DFloat" N="Out" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="End" V="1" />
        <SN N="Start" V="1" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="72d1ba8A21faFFeC" T="NodeElastixProcessor" V="0.5" X="661" Y="141" FI="">
      <Inputs>
        <IO ID="066cAffF78ed0f4A" T="Image4DFloat" N="Fixed" MI="1" MA="1" />
        <IO ID="4dcb6332F77FbA4d" T="Image4DBool" N="Fixed Mask" MI="0" MA="1" />
        <IO ID="AD03AbE8faBBcf5c" T="Image4DFloat" N="Moving 1" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="CF1E6Ca6deFBA3E0" T="Image4DFloat" N="Out 1" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="NumImages" V="1" />
        <SN N="UseIT" V="False" />
        <SN N="UseFMasks" V="True" />
        <SN N="UseMMasks" V="False" />
        <SN N="MFixed" V="False" />
        <SN N="MMetric" V="False" />
        <SN N="NumAux" V="0" />
        <SN N="UseTFX" V="False" />
        <SN N="UseAT" V="False" />
        <SN N="Parameters" V="Ly8gRXhhbXBsZSBwYXJhbWV0ZXIgZmlsZSBmb3IgcmlnaWQgcmVnaXN0cmF0aW9uDQovLyBDLXN0eWxlIGNvbW1lbnRzOiAvLw0KDQovLyBUaGUgaW50ZXJuYWwgcGl4ZWwgdHlwZSwgdXNlZCBmb3IgaW50ZXJuYWwgY29tcHV0YXRpb25zDQovLyBMZWF2ZSB0byBmbG9hdCBpbiBnZW5lcmFsLiANCi8vIE5COiB0aGlzIGlzIG5vdCB0aGUgdHlwZSBvZiB0aGUgaW5wdXQgaW1hZ2VzISBUaGUgcGl4ZWwgDQovLyB0eXBlIG9mIHRoZSBpbnB1dCBpbWFnZXMgaXMgYXV0b21hdGljYWxseSByZWFkIGZyb20gdGhlIA0KLy8gaW1hZ2VzIHRoZW1zZWx2ZXMuDQovLyBUaGlzIHNldHRpbmcgY2FuIGJlIGNoYW5nZWQgdG8gInNob3J0IiB0byBzYXZlIHNvbWUgbWVtb3J5DQovLyBpbiBjYXNlIG9mIHZlcnkgbGFyZ2UgM0QgaW1hZ2VzLg0KKEZpeGVkSW50ZXJuYWxJbWFnZVBpeGVsVHlwZSAiZmxvYXQiKQ0KKE1vdmluZ0ludGVybmFsSW1hZ2VQaXhlbFR5cGUgImZsb2F0IikNCg0KLy8gVGhlIGRpbWVuc2lvbnMgb2YgdGhlIGZpeGVkIGFuZCBtb3ZpbmcgaW1hZ2UNCi8vIE5COiBUaGlzIGhhcyB0byBiZSBzcGVjaWZpZWQgYnkgdGhlIHVzZXIuIFRoZSBkaW1lbnNpb24gb2YNCi8vIHRoZSBpbWFnZXMgaXMgY3VycmVudGx5IE5PVCByZWFkIGZyb20gdGhlIGltYWdlcy4NCi8vIEFsc28gbm90ZSB0aGF0IHNvbWUgb3RoZXIgc2V0dGluZ3MgbWF5IGhhdmUgdG8gc3BlY2lmaWVkDQovLyBmb3IgZWFjaCBkaW1lbnNpb24gc2VwYXJhdGVseS4NCihGaXhlZEltYWdlRGltZW5zaW9uIDMpDQooTW92aW5nSW1hZ2VEaW1lbnNpb24gMykNCg0KLy8gU3BlY2lmeSB3aGV0aGVyIHlvdSB3YW50IHRvIHRha2UgaW50byBhY2NvdW50IHRoZSBzby1jYWxsZWQNCi8vIGRpcmVjdGlvbiBjb3NpbmVzIG9mIHRoZSBpbWFnZXMuIFJlY29tbWVuZGVkOiB0cnVlLg0KLy8gSW4gc29tZSBjYXNlcywgdGhlIGRpcmVjdGlvbiBjb3NpbmVzIG9mIHRoZSBpbWFnZSBhcmUgY29ycnVwdCwNCi8vIGR1ZSB0byBpbWFnZSBmb3JtYXQgY29udmVyc2lvbnMgZm9yIGV4YW1wbGUuIEluIHRoYXQgY2FzZSwgeW91IA0KLy8gbWF5IHdhbnQgdG8gc2V0IHRoaXMgb3B0aW9uIHRvICJmYWxzZSIuDQooVXNlRGlyZWN0aW9uQ29zaW5lcyAidHJ1ZSIpDQoNCi8vICoqKioqKioqKioqKioqKiogTWFpbiBDb21wb25lbnRzICoqKioqKioqKioqKioqKioqKioqKioqKioqDQoNCi8vIFRoZSBmb2xsb3dpbmcgY29tcG9uZW50cyBzaG91bGQgdXN1YWxseSBiZSBsZWZ0IGFzIHRoZXkgYXJlOg0KKFJlZ2lzdHJhdGlvbiAiTXVsdGlSZXNvbHV0aW9uUmVnaXN0cmF0aW9uIikNCihJbnRlcnBvbGF0b3IgIkxpbmVhckludGVycG9sYXRvciIpDQooUmVzYW1wbGVJbnRlcnBvbGF0b3IgIkZpbmFsQlNwbGluZUludGVycG9sYXRvciIpDQooUmVzYW1wbGVyICJEZWZhdWx0UmVzYW1wbGVyIikNCg0KLy8gVGhlc2UgbWF5IGJlIGNoYW5nZWQgdG8gRml4ZWQvTW92aW5nUmVjdXJzaXZlSW1hZ2VQeXJhbWlkIG9yIA0KLy8gRml4ZWQvTW92aW5nU2hyaW5raW5nSW1hZ2VQeXJhbWlkLg0KLy8gU2VlIHRoZSBtYW51YWwuDQooRml4ZWRJbWFnZVB5cmFtaWQgIkZpeGVkU21vb3RoaW5nSW1hZ2VQeXJhbWlkIikNCihNb3ZpbmdJbWFnZVB5cmFtaWQgIk1vdmluZ1Ntb290aGluZ0ltYWdlUHlyYW1pZCIpDQoNCi8vIFRoZSBmb2xsb3dpbmcgY29tcG9uZW50cyBhcmUgbW9zdCBpbXBvcnRhbnQ6DQovLyBUaGUgb3B0aW1pemVyIEFkYXB0aXZlU3RvY2hhc3RpY0dyYWRpZW50RGVzY2VudCAoQVNHRCkgd29ya3MNCi8vIHF1aXRlIG9rIGluIGdlbmVyYWwuIFRoZSBUcmFuc2Zvcm0gYW5kIE1ldHJpYyBhcmUgaW1wb3J0YW50DQovLyBhbmQgbmVlZCB0byBiZSBjaG9zZW4gY2FyZWZ1bCBmb3IgZWFjaCBhcHBsaWNhdGlvbi4gU2VlIG1hbnVhbC4NCihPcHRpbWl6ZXIgIkFkYXB0aXZlU3RvY2hhc3RpY0dyYWRpZW50RGVzY2VudCIpDQooVHJhbnNmb3JtICJFdWxlclRyYW5zZm9ybSIpDQooTWV0cmljICJBZHZhbmNlZE1hdHRlc011dHVhbEluZm9ybWF0aW9uIikNCg0KLy8gKioqKioqKioqKioqKioqKiogVHJhbnNmb3JtYXRpb24gKioqKioqKioqKioqKioqKioqKioqKioqKioNCg0KLy8gU2NhbGVzIHRoZSByb3RhdGlvbnMgY29tcGFyZWQgdG8gdGhlIHRyYW5zbGF0aW9ucywgdG8gbWFrZQ0KLy8gc3VyZSB0aGV5IGFyZSBpbiB0aGUgc2FtZSByYW5nZS4gSW4gZ2VuZXJhbCwgaXQncyBiZXN0IHRvICANCi8vIHVzZSBhdXRvbWF0aWMgc2NhbGVzIGVzdGltYXRpb246DQooQXV0b21hdGljU2NhbGVzRXN0aW1hdGlvbiAidHJ1ZSIpDQoNCi8vIEF1dG9tYXRpY2FsbHkgZ3Vlc3MgYW4gaW5pdGlhbCB0cmFuc2xhdGlvbiBieSBhbGlnbmluZyB0aGUNCi8vIGdlb21ldHJpYyBjZW50ZXJzLCB0aGUgbWFzcyBjZW50ZXJzIG9yIG9yaWdpbnMgb2YgdGhlIA0KLy8gZml4ZWQgYW5kIG1vdmluZyBpbWFnZXMuIElmIHRoZSBpbWFnZXMgYXJlIGFjcXVpcmVkIGluIHRoZSANCi8vIHNhbWUgZXhhbWluYXRpb24gdGhpcyBzaG91bGQgYmUgc2V0IHRvICJmYWxzZSIuIElmIHRoZSBpbWFnZXMgDQovLyBhcmUgZnJvbSBkaWZmZXJlbnQgbW9kYWxpdGllcyBvciBhY3F1aXJlZCBhdCBkaWZmZXJlbnQgDQovLyBleGFtaW5hdGlvbnMsIHRoaXMgc2hvdWxkIGJlIHNldCB0byAidHJ1ZSIuIElmIHRoaXMgaXMgc2V0IA0KLy8gdG8gImZhbHNlIiBhbmQgeW91IGdldCB0aGUgZXJyb3IgIlRvbyBtYW55IHNhbXBsZXMgbWFwIG91dHNpZGUgDQovLyBtb3ZpbmcgaW1hZ2UgYnVmZmVyIiwgY2hhbmdlIHRoaXMgdG8gInRydWUiLg0KKEF1dG9tYXRpY1RyYW5zZm9ybUluaXRpYWxpemF0aW9uICJ0cnVlIikNCg0KLy8gU2V0IHRoZSBtZXRob2Qgb2YgaW5pdGlhbGl6YXRpb24uIEdlb21ldHJpY2FsIGNlbnRlciBpcyB0aGUgZGVmYXVsdC4NCi8vIE5vdGUgdGhhdCAiT3JpZ2lucyIgaXMgY3VycmVudGx5IG9ubHkgYXZhaWxhYmxlIGZvciB0aGUgYWZmaW5lIA0KLy8gdHJhbnNmb3JtYXRpb24uDQovLyhBdXRvbWF0aWNUcmFuc2Zvcm1Jbml0aWFsaXphdGlvbk1ldGhvZCAiQ2VudGVyT2ZHcmF2aXR5IikgDQovLyhBdXRvbWF0aWNUcmFuc2Zvcm1Jbml0aWFsaXphdGlvbk1ldGhvZCAiT3JpZ2lucyIpDQooQXV0b21hdGljVHJhbnNmb3JtSW5pdGlhbGl6YXRpb25NZXRob2QgIkdlb21ldHJpY2FsQ2VudGVyIikgDQoNCi8vIFdoZXRoZXIgdHJhbnNmb3JtcyBhcmUgY29tYmluZWQgYnkgY29tcG9zaXRpb24gb3IgYnkgYWRkaXRpb24uDQovLyBJbiBnZW5lcmFsbHksIENvbXBvc2UgaXMgdGhlIGJlc3Qgb3B0aW9uIGluIG1vc3QgY2FzZXMuDQovLyBJdCBkb2VzIG5vdCBpbmZsdWVuY2UgdGhlIHJlc3VsdHMgdmVyeSBtdWNoLg0KKEhvd1RvQ29tYmluZVRyYW5zZm9ybXMgIkNvbXBvc2UiKQ0KDQovLyAqKioqKioqKioqKioqKioqKioqIFNpbWlsYXJpdHkgbWVhc3VyZSAqKioqKioqKioqKioqKioqKioqKioNCg0KLy8gTnVtYmVyIG9mIGdyZXkgbGV2ZWwgYmlucyBpbiBlYWNoIHJlc29sdXRpb24gbGV2ZWwsDQovLyBmb3IgdGhlIG11dHVhbCBpbmZvcm1hdGlvbi4gMTYgb3IgMzIgdXN1YWxseSB3b3JrcyBmaW5lLg0KLy8gWW91IGNvdWxkIGFsc28gZW1wbG95IGEgaGllcmFyY2hpY2FsIHN0cmF0ZWd5Og0KLy8oTnVtYmVyT2ZIaXN0b2dyYW1CaW5zIDE2IDMyIDY0KQ0KKE51bWJlck9mSGlzdG9ncmFtQmlucyAzMikNCg0KLy8gSWYgeW91IHVzZSBhIG1hc2ssIHRoaXMgb3B0aW9uIGlzIGltcG9ydGFudC4gDQovLyBJZiB0aGUgbWFzayBzZXJ2ZXMgYXMgcmVnaW9uIG9mIGludGVyZXN0LCBzZXQgaXQgdG8gZmFsc2UuDQovLyBJZiB0aGUgbWFzayBpbmRpY2F0ZXMgd2hpY2ggcGl4ZWxzIGFyZSB2YWxpZCwgdGhlbiBzZXQgaXQgdG8gdHJ1ZS4NCi8vIElmIHlvdSBkbyBub3QgdXNlIGEgbWFzaywgdGhlIG9wdGlvbiBkb2Vzbid0IG1hdHRlci4NCihFcm9kZU1hc2sgImZhbHNlIikNCg0KLy8gKioqKioqKioqKioqKioqKioqKiogTXVsdGlyZXNvbHV0aW9uICoqKioqKioqKioqKioqKioqKioqKioNCg0KLy8gVGhlIG51bWJlciBvZiByZXNvbHV0aW9ucy4gMSBJcyBvbmx5IGVub3VnaCBpZiB0aGUgZXhwZWN0ZWQNCi8vIGRlZm9ybWF0aW9ucyBhcmUgc21hbGwuIDMgb3IgNCBtb3N0bHkgd29ya3MgZmluZS4gRm9yIGxhcmdlDQovLyBpbWFnZXMgYW5kIGxhcmdlIGRlZm9ybWF0aW9ucywgNSBvciA2IG1heSBldmVuIGJlIHVzZWZ1bC4NCihOdW1iZXJPZlJlc29sdXRpb25zIDMpDQoNCi8vIFRoZSBkb3duc2FtcGxpbmcvYmx1cnJpbmcgZmFjdG9ycyBmb3IgdGhlIGltYWdlIHB5cmFtaWRzLg0KLy8gQnkgZGVmYXVsdCwgdGhlIGltYWdlcyBhcmUgZG93bnNhbXBsZWQgYnkgYSBmYWN0b3Igb2YgMg0KLy8gY29tcGFyZWQgdG8gdGhlIG5leHQgcmVzb2x1dGlvbi4NCi8vIFNvLCBpbiAyRCwgd2l0aCA0IHJlc29sdXRpb25zLCB0aGUgZm9sbG93aW5nIHNjaGVkdWxlIGlzIHVzZWQ6DQovLyhJbWFnZVB5cmFtaWRTY2hlZHVsZSA0IDQgIDIgMiAgMSAxICkNCi8vIEFuZCBpbiAzRDoNCi8vKEltYWdlUHlyYW1pZFNjaGVkdWxlIDQgNCA0ICAyIDIgMiAgMSAxIDEgKQ0KLy8gWW91IGNhbiBzcGVjaWZ5IGFueSBzY2hlZHVsZSwgZm9yIGJvdGggZml4ZWQgYW5kIG1vdmluZywgDQovLyBmb3IgZXhhbXBsZToNCi8vKEZpeGVkSW1hZ2VQeXJhbWlkU2NoZWR1bGUgNCA0IDQgIDIgMiAyICAxIDEgMSApDQovLyhNb3ZpbmdJbWFnZVB5cmFtaWRTY2hlZHVsZSA0IDQgMiAgMiAyIDEgIDEgMSAxICkNCi8vIE1ha2Ugc3VyZSB0aGF0IHRoZSBudW1iZXIgb2YgZWxlbWVudHMgZXF1YWxzIHRoZSBudW1iZXINCi8vIG9mIHJlc29sdXRpb25zIHRpbWVzIHRoZSBpbWFnZSBkaW1lbnNpb24uDQoNCi8vICoqKioqKioqKioqKioqKioqKiogT3B0aW1pemVyICoqKioqKioqKioqKioqKioqKioqKioqKioqKioNCg0KLy8gTWF4aW11bSBudW1iZXIgb2YgaXRlcmF0aW9ucyBpbiBlYWNoIHJlc29sdXRpb24gbGV2ZWw6DQovLyAyMDAtNTAwIHdvcmtzIHVzdWFsbHkgZmluZSBmb3IgcmlnaWQgcmVnaXN0cmF0aW9uLg0KLy8gRm9yIG1vcmUgcm9idXN0bmVzcywgeW91IG1heSBpbmNyZWFzZSB0aGlzIHRvIDEwMDAtMjAwMC4NCihNYXhpbXVtTnVtYmVyT2ZJdGVyYXRpb25zIDMwMCkNCg0KLy8gTWF4aW11bSBudW1iZXIgb2YgYXR0ZW1wdHMgdG8gc2FtcGxlIGRhdGEgZnJvbSB0aGUgbW92aW5nIGltYWdlIA0KLy8gYmVmb3JlIGdpdmluZyB1cCBhbmQgdGhyb3dpbmcgYW4gZXhjZXB0aW9uDQooTWF4aW11bU51bWJlck9mU2FtcGxpbmdBdHRlbXB0cyA4LjAwMDAwMCkNCg0KLy8gVGhlIGZyYWN0aW9uIG9mIHNhbXBsZXMgZnJvbSB0aGUgbW92aW5nIGltYWdlIHRoYXQgY29udGFpbiANCi8vIHZhbGlkIGluZm9ybWF0aW9uLiBJZiB5b3UgZ2V0IHRoZSBlcnJvciAiVG9vIG1hbnkgc2FtcGxlcw0KLy8gbWFwIG91dHNpZGUgbW92aW5nIGltYWdlIGJ1ZmZlciIgeW91IG1pZ2h0IHdhbnQgdG8gcmVkdWNlDQovLyB0aGlzIG51bWJlci4gDQooUmVxdWlyZWRSYXRpb09mVmFsaWRTYW1wbGVzIDAuMjUpDQoNCi8vIFRoZSBzdGVwIHNpemUgb2YgdGhlIG9wdGltaXplciwgaW4gbW0uIEJ5IGRlZmF1bHQgdGhlIHZveGVsIHNpemUgaXMgdXNlZC4NCi8vIHdoaWNoIHVzdWFsbHkgd29ya3Mgd2VsbC4gSW4gY2FzZSBvZiB1bnVzdWFsbHkgaGlnaC1yZXNvbHV0aW9uIGltYWdlcw0KLy8gKGVnIGhpc3RvbG9neSkgaXQgaXMgbmVjZXNzYXJ5IHRvIGluY3JlYXNlIHRoaXMgdmFsdWUgYSBiaXQsIHRvIHRoZSBzaXplDQovLyBvZiB0aGUgInNtYWxsZXN0IHZpc2libGUgc3RydWN0dXJlIiBpbiB0aGUgaW1hZ2U6DQooTWF4aW11bVN0ZXBMZW5ndGggNC4wIDIuMCAxLjApDQoNCi8vICoqKioqKioqKioqKioqKiogSW1hZ2Ugc2FtcGxpbmcgKioqKioqKioqKioqKioqKioqKioqKg0KDQovLyBOdW1iZXIgb2Ygc3BhdGlhbCBzYW1wbGVzIHVzZWQgdG8gY29tcHV0ZSB0aGUgbXV0dWFsDQovLyBpbmZvcm1hdGlvbiAoYW5kIGl0cyBkZXJpdmF0aXZlKSBpbiBlYWNoIGl0ZXJhdGlvbi4NCi8vIFdpdGggYW4gQWRhcHRpdmVTdG9jaGFzdGljR3JhZGllbnREZXNjZW50IG9wdGltaXplciwNCi8vIGluIGNvbWJpbmF0aW9uIHdpdGggdGhlIHR3byBvcHRpb25zIGJlbG93LCBhcm91bmQgMjAwMA0KLy8gc2FtcGxlcyBtYXkgYWxyZWFkeSBzdWZmaWNlLg0KKE51bWJlck9mU3BhdGlhbFNhbXBsZXMgMjA0OCkNCg0KLy8gUmVmcmVzaCB0aGVzZSBzcGF0aWFsIHNhbXBsZXMgaW4gZXZlcnkgaXRlcmF0aW9uLCBhbmQgc2VsZWN0DQovLyB0aGVtIHJhbmRvbWx5LiBTZWUgdGhlIG1hbnVhbCBmb3IgaW5mb3JtYXRpb24gb24gb3RoZXIgc2FtcGxpbmcNCi8vIHN0cmF0ZWdpZXMuDQooTmV3U2FtcGxlc0V2ZXJ5SXRlcmF0aW9uICJ0cnVlIikNCihJbWFnZVNhbXBsZXIgIlJhbmRvbUNvb3JkaW5hdGUiKQ0KDQovLyAqKioqKioqKioqKioqIEludGVycG9sYXRpb24gYW5kIFJlc2FtcGxpbmcgKioqKioqKioqKioqKioqKg0KDQovLyBPcmRlciBvZiBCLVNwbGluZSBpbnRlcnBvbGF0aW9uIHVzZWQgZHVyaW5nIHJlZ2lzdHJhdGlvbi9vcHRpbWlzYXRpb24uDQovLyBJdCBtYXkgaW1wcm92ZSBhY2N1cmFjeSBpZiB5b3Ugc2V0IHRoaXMgdG8gMy4gTmV2ZXIgdXNlIDAuDQovLyBBbiBvcmRlciBvZiAxIGdpdmVzIGxpbmVhciBpbnRlcnBvbGF0aW9uLiBUaGlzIGlzIGluIG1vc3QgDQovLyBhcHBsaWNhdGlvbnMgYSBnb29kIGNob2ljZS4gSWYgIkxpbmVhckludGVycG9sYXRvciIgaXMgdXNlZCB0aGlzIGlzIA0KLy8gbm90IGFwcGxpY2FibGUuDQovLyAoQlNwbGluZUludGVycG9sYXRpb25PcmRlciAxKQ0KDQovLyBPcmRlciBvZiBCLVNwbGluZSBpbnRlcnBvbGF0aW9uIHVzZWQgZm9yIGFwcGx5aW5nIHRoZSBmaW5hbA0KLy8gZGVmb3JtYXRpb24uDQovLyAzIGdpdmVzIGdvb2QgYWNjdXJhY3k7IHJlY29tbWVuZGVkIGluIG1vc3QgY2FzZXMuDQovLyAxIGdpdmVzIHdvcnNlIGFjY3VyYWN5IChsaW5lYXIgaW50ZXJwb2xhdGlvbikNCi8vIDAgZ2l2ZXMgd29yc3QgYWNjdXJhY3ksIGJ1dCBpcyBhcHByb3ByaWF0ZSBmb3IgYmluYXJ5IGltYWdlcw0KLy8gKG1hc2tzLCBzZWdtZW50YXRpb25zKTsgZXF1aXZhbGVudCB0byBuZWFyZXN0IG5laWdoYm9yIGludGVycG9sYXRpb24uDQooRmluYWxCU3BsaW5lSW50ZXJwb2xhdGlvbk9yZGVyIDMpDQoNCi8vRGVmYXVsdCBwaXhlbCB2YWx1ZSBmb3IgcGl4ZWxzIHRoYXQgY29tZSBmcm9tIG91dHNpZGUgdGhlIGltYWdlOg0KKERlZmF1bHRQaXhlbFZhbHVlIDApDQoNCi8vIFRoZSBwaXhlbCB0eXBlIG9mIHRoZSByZXN1bHRpbmcgZGVmb3JtZWQgbW92aW5nIGltYWdlDQooUmVzdWx0SW1hZ2VQaXhlbFR5cGUgImZsb2F0Iik=" />
        <SN N="TwoD" V="False" />
        <SN N="ST" V="False" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="3D21Ca4CA435eEC4" T="NodeIORepeater" V="0.1" X="226" Y="175" FI="">
      <Inputs>
        <IO ID="5eefA5CBdA577bE5" T="Image4DFloat" N="In" MI="1" MA="2147483647" />
      </Inputs>
      <Outputs>
        <IO ID="6a1F6fAFC5cbd466" T="Image4DFloat" N="Out" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Desc" V="" />
        <SN N="Sim" V="False" />
        <SN N="SetNewName" V="False" />
        <SN N="IOType" V="Mice.Types.Image4DFloat" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="A68e656F715E3BeB" T="NodeIORepeater" V="0.1" X="545" Y="175" FI="">
      <Inputs>
        <IO ID="cc1eEad15fbdCB43" T="Image4DFloat" N="In" MI="1" MA="2147483647" />
      </Inputs>
      <Outputs>
        <IO ID="fBd506F3a37045B2" T="Image4DFloat" N="Out" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Desc" V="" />
        <SN N="Sim" V="False" />
        <SN N="SetNewName" V="False" />
        <SN N="IOType" V="Mice.Types.Image4DFloat" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
  </Nodes>
  <Connections>
    <CN ID1="0f6C04Ff43F03d5F" ID2="788FC0Ab42AEbd51" />
    <CN ID1="47bF41B7CcD3C74f" ID2="Fa147BAfDb606BcF" />
    <CN ID1="ebeD2A68bc8F76fF" ID2="C2DdbCbBb1b08A3c" />
    <CN ID1="cFeC1E5DDc0d67da" ID2="77D08C34dbbCAD0f" />
    <CN ID1="f8C1bDEfEE0d7bbF" ID2="763b63E461BB21c5" />
    <CN ID1="57163B12e48F23bc" ID2="aA314Dbf0Fbbbc1b" />
    <CN ID1="8BC0Cc513441d78F" ID2="763b63E461BB21c5" />
    <CN ID1="066cAffF78ed0f4A" ID2="fBd506F3a37045B2" />
    <CN ID1="4dcb6332F77FbA4d" ID2="fd10CADe1F3EbCf7" />
    <CN ID1="AD03AbE8faBBcf5c" ID2="fBd506F3a37045B2" />
    <CN ID1="5eefA5CBdA577bE5" ID2="763b63E461BB21c5" />
    <CN ID1="cc1eEad15fbdCB43" ID2="6a1F6fAFC5cbd466" />
  </Connections>
  <Notes />
</MICE>