<?xml version="1.0" encoding="utf-8"?>
<MICE Version="1.0.4.0" Timestamp="2018-06-29 10:14:35.8589523" ID="df4f10aBEEac1C82" Name="GenerateImages">
  <Nodes>
    <Node ID="1EABCf251cEC6dc5" T="NodeReadDicomFolder" V="0.1" X="-677" Y="235" FI="">
      <Inputs />
      <Outputs>
        <IO ID="D4De3a1D3266BFfE" T="Image4DFloat" N="File" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Folder" V="C:\Temp\Fett\T1-21procent_1\00000453" />
        <SN N="SetNewName" V="False" />
        <SN N="NewName" V="" />
        <SN N="FileType" V="Mice.Types.Image4DFloat" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="4623Cb5B824ac1F0" T="NodeReadDicomDB" V="0.1" X="-684" Y="473" FI="">
      <Inputs />
      <Outputs>
        <IO ID="4cD8ba38Bcea5A43" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="SeriesID" V="30" />
        <SN N="DateOffset" V="0" />
        <SN N="MatchString" V="Fat Fraction ()" />
        <SN N="IgnoreBatch" V="False" />
        <SN N="SetNewName" V="False" />
        <SN N="NewName" V="" />
        <SN N="Modality" V="MR" />
        <SN N="StructSeriesIDs" V="" />
        <SN N="RegSeriesIDs" V="" />
        <SN N="Connection" V="Fett-tumör;;C:\Temp\Fett-tumör.sqlite;" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="Dd4F2E3fe8Cbe8A0" T="NodeReadDicomFolder" V="0.1" X="-676" Y="316" FI="">
      <Inputs />
      <Outputs>
        <IO ID="14c28EdACd4b114C" T="Image4DFloat" N="File" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Folder" V="C:\Temp\Fett\T1-62procent_1\00009B55" />
        <SN N="SetNewName" V="False" />
        <SN N="NewName" V="" />
        <SN N="FileType" V="Mice.Types.Image4DFloat" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="D0340A1eadbfFac0" T="NodeReadDicomDB" V="0.1" X="-681" Y="397" FI="">
      <Inputs />
      <Outputs>
        <IO ID="adD1E4dfB07Ef444" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="SeriesID" V="19" />
        <SN N="DateOffset" V="0" />
        <SN N="MatchString" V="Fat Fraction ()" />
        <SN N="IgnoreBatch" V="False" />
        <SN N="SetNewName" V="False" />
        <SN N="NewName" V="" />
        <SN N="Modality" V="MR" />
        <SN N="StructSeriesIDs" V="" />
        <SN N="RegSeriesIDs" V="" />
        <SN N="Connection" V="Fett-tumör;;C:\Temp\Fett-tumör.sqlite;" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="06FCed0BcAae8EAc" T="NodeElastixProcessor" V="0.5" X="65" Y="403" FI="">
      <Inputs>
        <IO ID="86DDBbc8adFFe2C7" T="Image4DFloat" N="Fixed" MI="1" MA="1" />
        <IO ID="4F6F4ee110F6d2c4" T="Image4DBool" N="Fixed Mask" MI="0" MA="1" />
        <IO ID="0BCeb0faBBa2e558" T="Image4DFloat" N="Moving 1" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="e3F0Bc342444Fe5B" T="Image4DFloat" N="Out 1" MI="1" MA="1" />
        <IO ID="b376Ad5ef5dCdEC5" T="TransformixParameter" N="TFX 1" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="NumImages" V="1" />
        <SN N="UseIT" V="False" />
        <SN N="UseFMasks" V="True" />
        <SN N="UseMMasks" V="False" />
        <SN N="MFixed" V="False" />
        <SN N="MMetric" V="False" />
        <SN N="NumAux" V="0" />
        <SN N="UseTFX" V="True" />
        <SN N="UseAT" V="False" />
        <SN N="Parameters" V="Ly8gRXhhbXBsZSBwYXJhbWV0ZXIgZmlsZSBmb3IgcmlnaWQgcmVnaXN0cmF0aW9uDQovLyBDLXN0eWxlIGNvbW1lbnRzOiAvLw0KDQovLyBUaGUgaW50ZXJuYWwgcGl4ZWwgdHlwZSwgdXNlZCBmb3IgaW50ZXJuYWwgY29tcHV0YXRpb25zDQovLyBMZWF2ZSB0byBmbG9hdCBpbiBnZW5lcmFsLiANCi8vIE5COiB0aGlzIGlzIG5vdCB0aGUgdHlwZSBvZiB0aGUgaW5wdXQgaW1hZ2VzISBUaGUgcGl4ZWwgDQovLyB0eXBlIG9mIHRoZSBpbnB1dCBpbWFnZXMgaXMgYXV0b21hdGljYWxseSByZWFkIGZyb20gdGhlIA0KLy8gaW1hZ2VzIHRoZW1zZWx2ZXMuDQovLyBUaGlzIHNldHRpbmcgY2FuIGJlIGNoYW5nZWQgdG8gInNob3J0IiB0byBzYXZlIHNvbWUgbWVtb3J5DQovLyBpbiBjYXNlIG9mIHZlcnkgbGFyZ2UgM0QgaW1hZ2VzLg0KKEZpeGVkSW50ZXJuYWxJbWFnZVBpeGVsVHlwZSAiZmxvYXQiKQ0KKE1vdmluZ0ludGVybmFsSW1hZ2VQaXhlbFR5cGUgImZsb2F0IikNCg0KLy8gVGhlIGRpbWVuc2lvbnMgb2YgdGhlIGZpeGVkIGFuZCBtb3ZpbmcgaW1hZ2UNCi8vIE5COiBUaGlzIGhhcyB0byBiZSBzcGVjaWZpZWQgYnkgdGhlIHVzZXIuIFRoZSBkaW1lbnNpb24gb2YNCi8vIHRoZSBpbWFnZXMgaXMgY3VycmVudGx5IE5PVCByZWFkIGZyb20gdGhlIGltYWdlcy4NCi8vIEFsc28gbm90ZSB0aGF0IHNvbWUgb3RoZXIgc2V0dGluZ3MgbWF5IGhhdmUgdG8gc3BlY2lmaWVkDQovLyBmb3IgZWFjaCBkaW1lbnNpb24gc2VwYXJhdGVseS4NCihGaXhlZEltYWdlRGltZW5zaW9uIDMpDQooTW92aW5nSW1hZ2VEaW1lbnNpb24gMykNCg0KLy8gU3BlY2lmeSB3aGV0aGVyIHlvdSB3YW50IHRvIHRha2UgaW50byBhY2NvdW50IHRoZSBzby1jYWxsZWQNCi8vIGRpcmVjdGlvbiBjb3NpbmVzIG9mIHRoZSBpbWFnZXMuIFJlY29tbWVuZGVkOiB0cnVlLg0KLy8gSW4gc29tZSBjYXNlcywgdGhlIGRpcmVjdGlvbiBjb3NpbmVzIG9mIHRoZSBpbWFnZSBhcmUgY29ycnVwdCwNCi8vIGR1ZSB0byBpbWFnZSBmb3JtYXQgY29udmVyc2lvbnMgZm9yIGV4YW1wbGUuIEluIHRoYXQgY2FzZSwgeW91IA0KLy8gbWF5IHdhbnQgdG8gc2V0IHRoaXMgb3B0aW9uIHRvICJmYWxzZSIuDQooVXNlRGlyZWN0aW9uQ29zaW5lcyAidHJ1ZSIpDQoNCi8vICoqKioqKioqKioqKioqKiogTWFpbiBDb21wb25lbnRzICoqKioqKioqKioqKioqKioqKioqKioqKioqDQoNCi8vIFRoZSBmb2xsb3dpbmcgY29tcG9uZW50cyBzaG91bGQgdXN1YWxseSBiZSBsZWZ0IGFzIHRoZXkgYXJlOg0KKFJlZ2lzdHJhdGlvbiAiTXVsdGlSZXNvbHV0aW9uUmVnaXN0cmF0aW9uIikNCihJbnRlcnBvbGF0b3IgIkxpbmVhckludGVycG9sYXRvciIpDQooUmVzYW1wbGVJbnRlcnBvbGF0b3IgIkZpbmFsQlNwbGluZUludGVycG9sYXRvciIpDQooUmVzYW1wbGVyICJEZWZhdWx0UmVzYW1wbGVyIikNCg0KLy8gVGhlc2UgbWF5IGJlIGNoYW5nZWQgdG8gRml4ZWQvTW92aW5nUmVjdXJzaXZlSW1hZ2VQeXJhbWlkIG9yIA0KLy8gRml4ZWQvTW92aW5nU2hyaW5raW5nSW1hZ2VQeXJhbWlkLg0KLy8gU2VlIHRoZSBtYW51YWwuDQooRml4ZWRJbWFnZVB5cmFtaWQgIkZpeGVkU21vb3RoaW5nSW1hZ2VQeXJhbWlkIikNCihNb3ZpbmdJbWFnZVB5cmFtaWQgIk1vdmluZ1Ntb290aGluZ0ltYWdlUHlyYW1pZCIpDQoNCi8vIFRoZSBmb2xsb3dpbmcgY29tcG9uZW50cyBhcmUgbW9zdCBpbXBvcnRhbnQ6DQovLyBUaGUgb3B0aW1pemVyIEFkYXB0aXZlU3RvY2hhc3RpY0dyYWRpZW50RGVzY2VudCAoQVNHRCkgd29ya3MNCi8vIHF1aXRlIG9rIGluIGdlbmVyYWwuIFRoZSBUcmFuc2Zvcm0gYW5kIE1ldHJpYyBhcmUgaW1wb3J0YW50DQovLyBhbmQgbmVlZCB0byBiZSBjaG9zZW4gY2FyZWZ1bCBmb3IgZWFjaCBhcHBsaWNhdGlvbi4gU2VlIG1hbnVhbC4NCihPcHRpbWl6ZXIgIkFkYXB0aXZlU3RvY2hhc3RpY0dyYWRpZW50RGVzY2VudCIpDQooVHJhbnNmb3JtICJFdWxlclRyYW5zZm9ybSIpDQooTWV0cmljICJBZHZhbmNlZE1hdHRlc011dHVhbEluZm9ybWF0aW9uIikNCg0KLy8gKioqKioqKioqKioqKioqKiogVHJhbnNmb3JtYXRpb24gKioqKioqKioqKioqKioqKioqKioqKioqKioNCg0KLy8gU2NhbGVzIHRoZSByb3RhdGlvbnMgY29tcGFyZWQgdG8gdGhlIHRyYW5zbGF0aW9ucywgdG8gbWFrZQ0KLy8gc3VyZSB0aGV5IGFyZSBpbiB0aGUgc2FtZSByYW5nZS4gSW4gZ2VuZXJhbCwgaXQncyBiZXN0IHRvICANCi8vIHVzZSBhdXRvbWF0aWMgc2NhbGVzIGVzdGltYXRpb246DQooQXV0b21hdGljU2NhbGVzRXN0aW1hdGlvbiAidHJ1ZSIpDQoNCi8vIEF1dG9tYXRpY2FsbHkgZ3Vlc3MgYW4gaW5pdGlhbCB0cmFuc2xhdGlvbiBieSBhbGlnbmluZyB0aGUNCi8vIGdlb21ldHJpYyBjZW50ZXJzLCB0aGUgbWFzcyBjZW50ZXJzIG9yIG9yaWdpbnMgb2YgdGhlIA0KLy8gZml4ZWQgYW5kIG1vdmluZyBpbWFnZXMuIElmIHRoZSBpbWFnZXMgYXJlIGFjcXVpcmVkIGluIHRoZSANCi8vIHNhbWUgZXhhbWluYXRpb24gdGhpcyBzaG91bGQgYmUgc2V0IHRvICJmYWxzZSIuIElmIHRoZSBpbWFnZXMgDQovLyBhcmUgZnJvbSBkaWZmZXJlbnQgbW9kYWxpdGllcyBvciBhY3F1aXJlZCBhdCBkaWZmZXJlbnQgDQovLyBleGFtaW5hdGlvbnMsIHRoaXMgc2hvdWxkIGJlIHNldCB0byAidHJ1ZSIuIElmIHRoaXMgaXMgc2V0IA0KLy8gdG8gImZhbHNlIiBhbmQgeW91IGdldCB0aGUgZXJyb3IgIlRvbyBtYW55IHNhbXBsZXMgbWFwIG91dHNpZGUgDQovLyBtb3ZpbmcgaW1hZ2UgYnVmZmVyIiwgY2hhbmdlIHRoaXMgdG8gInRydWUiLg0KKEF1dG9tYXRpY1RyYW5zZm9ybUluaXRpYWxpemF0aW9uICJmYWxzZSIpDQoNCi8vIFNldCB0aGUgbWV0aG9kIG9mIGluaXRpYWxpemF0aW9uLiBHZW9tZXRyaWNhbCBjZW50ZXIgaXMgdGhlIGRlZmF1bHQuDQovLyBOb3RlIHRoYXQgIk9yaWdpbnMiIGlzIGN1cnJlbnRseSBvbmx5IGF2YWlsYWJsZSBmb3IgdGhlIGFmZmluZSANCi8vIHRyYW5zZm9ybWF0aW9uLg0KLy8oQXV0b21hdGljVHJhbnNmb3JtSW5pdGlhbGl6YXRpb25NZXRob2QgIkNlbnRlck9mR3Jhdml0eSIpIA0KLy8oQXV0b21hdGljVHJhbnNmb3JtSW5pdGlhbGl6YXRpb25NZXRob2QgIk9yaWdpbnMiKQ0KKEF1dG9tYXRpY1RyYW5zZm9ybUluaXRpYWxpemF0aW9uTWV0aG9kICJHZW9tZXRyaWNhbENlbnRlciIpIA0KDQovLyBXaGV0aGVyIHRyYW5zZm9ybXMgYXJlIGNvbWJpbmVkIGJ5IGNvbXBvc2l0aW9uIG9yIGJ5IGFkZGl0aW9uLg0KLy8gSW4gZ2VuZXJhbGx5LCBDb21wb3NlIGlzIHRoZSBiZXN0IG9wdGlvbiBpbiBtb3N0IGNhc2VzLg0KLy8gSXQgZG9lcyBub3QgaW5mbHVlbmNlIHRoZSByZXN1bHRzIHZlcnkgbXVjaC4NCihIb3dUb0NvbWJpbmVUcmFuc2Zvcm1zICJDb21wb3NlIikNCg0KLy8gKioqKioqKioqKioqKioqKioqKiBTaW1pbGFyaXR5IG1lYXN1cmUgKioqKioqKioqKioqKioqKioqKioqDQoNCi8vIE51bWJlciBvZiBncmV5IGxldmVsIGJpbnMgaW4gZWFjaCByZXNvbHV0aW9uIGxldmVsLA0KLy8gZm9yIHRoZSBtdXR1YWwgaW5mb3JtYXRpb24uIDE2IG9yIDMyIHVzdWFsbHkgd29ya3MgZmluZS4NCi8vIFlvdSBjb3VsZCBhbHNvIGVtcGxveSBhIGhpZXJhcmNoaWNhbCBzdHJhdGVneToNCi8vKE51bWJlck9mSGlzdG9ncmFtQmlucyAxNiAzMiA2NCkNCihOdW1iZXJPZkhpc3RvZ3JhbUJpbnMgMzIpDQoNCi8vIElmIHlvdSB1c2UgYSBtYXNrLCB0aGlzIG9wdGlvbiBpcyBpbXBvcnRhbnQuIA0KLy8gSWYgdGhlIG1hc2sgc2VydmVzIGFzIHJlZ2lvbiBvZiBpbnRlcmVzdCwgc2V0IGl0IHRvIGZhbHNlLg0KLy8gSWYgdGhlIG1hc2sgaW5kaWNhdGVzIHdoaWNoIHBpeGVscyBhcmUgdmFsaWQsIHRoZW4gc2V0IGl0IHRvIHRydWUuDQovLyBJZiB5b3UgZG8gbm90IHVzZSBhIG1hc2ssIHRoZSBvcHRpb24gZG9lc24ndCBtYXR0ZXIuDQooRXJvZGVNYXNrICJmYWxzZSIpDQoNCi8vICoqKioqKioqKioqKioqKioqKioqIE11bHRpcmVzb2x1dGlvbiAqKioqKioqKioqKioqKioqKioqKioqDQoNCi8vIFRoZSBudW1iZXIgb2YgcmVzb2x1dGlvbnMuIDEgSXMgb25seSBlbm91Z2ggaWYgdGhlIGV4cGVjdGVkDQovLyBkZWZvcm1hdGlvbnMgYXJlIHNtYWxsLiAzIG9yIDQgbW9zdGx5IHdvcmtzIGZpbmUuIEZvciBsYXJnZQ0KLy8gaW1hZ2VzIGFuZCBsYXJnZSBkZWZvcm1hdGlvbnMsIDUgb3IgNiBtYXkgZXZlbiBiZSB1c2VmdWwuDQooTnVtYmVyT2ZSZXNvbHV0aW9ucyAzKQ0KDQovLyBUaGUgZG93bnNhbXBsaW5nL2JsdXJyaW5nIGZhY3RvcnMgZm9yIHRoZSBpbWFnZSBweXJhbWlkcy4NCi8vIEJ5IGRlZmF1bHQsIHRoZSBpbWFnZXMgYXJlIGRvd25zYW1wbGVkIGJ5IGEgZmFjdG9yIG9mIDINCi8vIGNvbXBhcmVkIHRvIHRoZSBuZXh0IHJlc29sdXRpb24uDQovLyBTbywgaW4gMkQsIHdpdGggNCByZXNvbHV0aW9ucywgdGhlIGZvbGxvd2luZyBzY2hlZHVsZSBpcyB1c2VkOg0KLy8oSW1hZ2VQeXJhbWlkU2NoZWR1bGUgNCA0ICAyIDIgIDEgMSApDQovLyBBbmQgaW4gM0Q6DQovLyhJbWFnZVB5cmFtaWRTY2hlZHVsZSA0IDQgNCAgMiAyIDIgIDEgMSAxICkNCi8vIFlvdSBjYW4gc3BlY2lmeSBhbnkgc2NoZWR1bGUsIGZvciBib3RoIGZpeGVkIGFuZCBtb3ZpbmcsIA0KLy8gZm9yIGV4YW1wbGU6DQovLyhGaXhlZEltYWdlUHlyYW1pZFNjaGVkdWxlIDQgNCA0ICAyIDIgMiAgMSAxIDEgKQ0KLy8oTW92aW5nSW1hZ2VQeXJhbWlkU2NoZWR1bGUgNCA0IDIgIDIgMiAxICAxIDEgMSApDQovLyBNYWtlIHN1cmUgdGhhdCB0aGUgbnVtYmVyIG9mIGVsZW1lbnRzIGVxdWFscyB0aGUgbnVtYmVyDQovLyBvZiByZXNvbHV0aW9ucyB0aW1lcyB0aGUgaW1hZ2UgZGltZW5zaW9uLg0KDQovLyAqKioqKioqKioqKioqKioqKioqIE9wdGltaXplciAqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQoNCi8vIE1heGltdW0gbnVtYmVyIG9mIGl0ZXJhdGlvbnMgaW4gZWFjaCByZXNvbHV0aW9uIGxldmVsOg0KLy8gMjAwLTUwMCB3b3JrcyB1c3VhbGx5IGZpbmUgZm9yIHJpZ2lkIHJlZ2lzdHJhdGlvbi4NCi8vIEZvciBtb3JlIHJvYnVzdG5lc3MsIHlvdSBtYXkgaW5jcmVhc2UgdGhpcyB0byAxMDAwLTIwMDAuDQooTWF4aW11bU51bWJlck9mSXRlcmF0aW9ucyAzMDApDQoNCi8vIE1heGltdW0gbnVtYmVyIG9mIGF0dGVtcHRzIHRvIHNhbXBsZSBkYXRhIGZyb20gdGhlIG1vdmluZyBpbWFnZSANCi8vIGJlZm9yZSBnaXZpbmcgdXAgYW5kIHRocm93aW5nIGFuIGV4Y2VwdGlvbg0KKE1heGltdW1OdW1iZXJPZlNhbXBsaW5nQXR0ZW1wdHMgOC4wMDAwMDApDQoNCi8vIFRoZSBmcmFjdGlvbiBvZiBzYW1wbGVzIGZyb20gdGhlIG1vdmluZyBpbWFnZSB0aGF0IGNvbnRhaW4gDQovLyB2YWxpZCBpbmZvcm1hdGlvbi4gSWYgeW91IGdldCB0aGUgZXJyb3IgIlRvbyBtYW55IHNhbXBsZXMNCi8vIG1hcCBvdXRzaWRlIG1vdmluZyBpbWFnZSBidWZmZXIiIHlvdSBtaWdodCB3YW50IHRvIHJlZHVjZQ0KLy8gdGhpcyBudW1iZXIuIA0KKFJlcXVpcmVkUmF0aW9PZlZhbGlkU2FtcGxlcyAwLjI1KQ0KDQovLyBUaGUgc3RlcCBzaXplIG9mIHRoZSBvcHRpbWl6ZXIsIGluIG1tLiBCeSBkZWZhdWx0IHRoZSB2b3hlbCBzaXplIGlzIHVzZWQuDQovLyB3aGljaCB1c3VhbGx5IHdvcmtzIHdlbGwuIEluIGNhc2Ugb2YgdW51c3VhbGx5IGhpZ2gtcmVzb2x1dGlvbiBpbWFnZXMNCi8vIChlZyBoaXN0b2xvZ3kpIGl0IGlzIG5lY2Vzc2FyeSB0byBpbmNyZWFzZSB0aGlzIHZhbHVlIGEgYml0LCB0byB0aGUgc2l6ZQ0KLy8gb2YgdGhlICJzbWFsbGVzdCB2aXNpYmxlIHN0cnVjdHVyZSIgaW4gdGhlIGltYWdlOg0KKE1heGltdW1TdGVwTGVuZ3RoIDQuMCAyLjAgMS4wKQ0KDQovLyAqKioqKioqKioqKioqKioqIEltYWdlIHNhbXBsaW5nICoqKioqKioqKioqKioqKioqKioqKioNCg0KLy8gTnVtYmVyIG9mIHNwYXRpYWwgc2FtcGxlcyB1c2VkIHRvIGNvbXB1dGUgdGhlIG11dHVhbA0KLy8gaW5mb3JtYXRpb24gKGFuZCBpdHMgZGVyaXZhdGl2ZSkgaW4gZWFjaCBpdGVyYXRpb24uDQovLyBXaXRoIGFuIEFkYXB0aXZlU3RvY2hhc3RpY0dyYWRpZW50RGVzY2VudCBvcHRpbWl6ZXIsDQovLyBpbiBjb21iaW5hdGlvbiB3aXRoIHRoZSB0d28gb3B0aW9ucyBiZWxvdywgYXJvdW5kIDIwMDANCi8vIHNhbXBsZXMgbWF5IGFscmVhZHkgc3VmZmljZS4NCihOdW1iZXJPZlNwYXRpYWxTYW1wbGVzIDIwNDgpDQoNCi8vIFJlZnJlc2ggdGhlc2Ugc3BhdGlhbCBzYW1wbGVzIGluIGV2ZXJ5IGl0ZXJhdGlvbiwgYW5kIHNlbGVjdA0KLy8gdGhlbSByYW5kb21seS4gU2VlIHRoZSBtYW51YWwgZm9yIGluZm9ybWF0aW9uIG9uIG90aGVyIHNhbXBsaW5nDQovLyBzdHJhdGVnaWVzLg0KKE5ld1NhbXBsZXNFdmVyeUl0ZXJhdGlvbiAidHJ1ZSIpDQooSW1hZ2VTYW1wbGVyICJSYW5kb21Db29yZGluYXRlIikNCg0KLy8gKioqKioqKioqKioqKiBJbnRlcnBvbGF0aW9uIGFuZCBSZXNhbXBsaW5nICoqKioqKioqKioqKioqKioNCg0KLy8gT3JkZXIgb2YgQi1TcGxpbmUgaW50ZXJwb2xhdGlvbiB1c2VkIGR1cmluZyByZWdpc3RyYXRpb24vb3B0aW1pc2F0aW9uLg0KLy8gSXQgbWF5IGltcHJvdmUgYWNjdXJhY3kgaWYgeW91IHNldCB0aGlzIHRvIDMuIE5ldmVyIHVzZSAwLg0KLy8gQW4gb3JkZXIgb2YgMSBnaXZlcyBsaW5lYXIgaW50ZXJwb2xhdGlvbi4gVGhpcyBpcyBpbiBtb3N0IA0KLy8gYXBwbGljYXRpb25zIGEgZ29vZCBjaG9pY2UuIElmICJMaW5lYXJJbnRlcnBvbGF0b3IiIGlzIHVzZWQgdGhpcyBpcyANCi8vIG5vdCBhcHBsaWNhYmxlLg0KLy8gKEJTcGxpbmVJbnRlcnBvbGF0aW9uT3JkZXIgMSkNCg0KLy8gT3JkZXIgb2YgQi1TcGxpbmUgaW50ZXJwb2xhdGlvbiB1c2VkIGZvciBhcHBseWluZyB0aGUgZmluYWwNCi8vIGRlZm9ybWF0aW9uLg0KLy8gMyBnaXZlcyBnb29kIGFjY3VyYWN5OyByZWNvbW1lbmRlZCBpbiBtb3N0IGNhc2VzLg0KLy8gMSBnaXZlcyB3b3JzZSBhY2N1cmFjeSAobGluZWFyIGludGVycG9sYXRpb24pDQovLyAwIGdpdmVzIHdvcnN0IGFjY3VyYWN5LCBidXQgaXMgYXBwcm9wcmlhdGUgZm9yIGJpbmFyeSBpbWFnZXMNCi8vIChtYXNrcywgc2VnbWVudGF0aW9ucyk7IGVxdWl2YWxlbnQgdG8gbmVhcmVzdCBuZWlnaGJvciBpbnRlcnBvbGF0aW9uLg0KKEZpbmFsQlNwbGluZUludGVycG9sYXRpb25PcmRlciAzKQ0KDQovL0RlZmF1bHQgcGl4ZWwgdmFsdWUgZm9yIHBpeGVscyB0aGF0IGNvbWUgZnJvbSBvdXRzaWRlIHRoZSBpbWFnZToNCihEZWZhdWx0UGl4ZWxWYWx1ZSAwKQ0KDQovLyBUaGUgcGl4ZWwgdHlwZSBvZiB0aGUgcmVzdWx0aW5nIGRlZm9ybWVkIG1vdmluZyBpbWFnZQ0KKFJlc3VsdEltYWdlUGl4ZWxUeXBlICJmbG9hdCIp" />
        <SN N="TwoD" V="False" />
        <SN N="ST" V="False" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="a344B205eED1f8BE" T="NodeImageToMask" V="0.1" X="-448" Y="370" FI="">
      <Inputs>
        <IO ID="cE6C6045c44dAC4F" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="8f70FbcD6ADdF0FD" T="Image4DBool" N="Mask" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="DivVal" V="-100" />
        <SN N="DivType" V="Higher" />
        <SN N="Otsu" V="False" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="cF5F7C1D78206DE4" T="NodeResampleImageFilter" V="0.1" X="-252" Y="410" FI="">
      <Inputs>
        <IO ID="eBb3Fe0F0E10CF0D" T="Image4DFloat" N="Reference" MI="1" MA="1" />
        <IO ID="41D28FCB14dD7bAB" T="Image4DFloat" N="Input" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="361aa37bBDE0c0fE" T="Image4DFloat" N="Output" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Interpolator" V="Linear" />
        <SN N="SetNewFOR" V="True" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="2dBEB3fFfbCFcA25" T="NodeMaskToImage" V="0.1" X="-333" Y="381" FI="">
      <Inputs>
        <IO ID="df7edbbaB6C6c6eA" T="Image4DBool" N="Mask" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="6a4Ed0F272c4ac1E" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="HighVal" V="1" />
        <SN N="LowVal" V="0" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="cEe444022a417dAE" T="NodeImageToMask" V="0.1" X="-125" Y="417" FI="">
      <Inputs>
        <IO ID="DDeDba258b43347a" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="A14A5AA2deeF3aF3" T="Image4DBool" N="Mask" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="DivVal" V="1" />
        <SN N="DivType" V="HigherOrEqual" />
        <SN N="Otsu" V="False" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="BFAADeb46Ead5B76" T="NodeImageToMask" V="0.1" X="201" Y="413" FI="">
      <Inputs>
        <IO ID="4Fd7EC2ddFA65db7" T="Image4DFloat" N="Image" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="EbBdE00cF8CAfc54" T="Image4DBool" N="Mask" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="DivVal" V="0" />
        <SN N="DivType" V="Higher" />
        <SN N="Otsu" V="False" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="AA4e51f85cd77e83" T="NodeMaskToDouble" V="0.1" X="316" Y="398" FI="">
      <Inputs>
        <IO ID="Db2483Bd7bCE8C7a" T="Image4DBool" N="Image" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="6cEAE3F02a04FA1c" T="Double" N="Mass Center X" MI="1" MA="1" />
        <IO ID="B5dfC31FAfd1ded7" T="Double" N="Mass Center Y" MI="1" MA="1" />
        <IO ID="586ce38E01315Fa2" T="Double" N="Mass Center Z" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="PX" V="False" />
        <SN N="PY" V="False" />
        <SN N="PZ" V="False" />
        <SN N="CPX" V="False" />
        <SN N="CPY" V="False" />
        <SN N="CPZ" V="False" />
        <SN N="MCPX" V="True" />
        <SN N="MCPY" V="True" />
        <SN N="MCPZ" V="True" />
        <SN N="SX" V="False" />
        <SN N="SY" V="False" />
        <SN N="SZ" V="False" />
        <SN N="ST" V="False" />
        <SN N="VSX" V="False" />
        <SN N="VSY" V="False" />
        <SN N="VSZ" V="False" />
        <SN N="VCT" V="False" />
        <SN N="VCTT" V="False" />
        <SN N="VCTF" V="False" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="d5fF5D6dD8afF7DE" T="NodeMaskCustom" V="0.1" X="485" Y="449" FI="Center X (mm);Center Y (mm);Center Z (mm);">
      <Inputs>
        <IO ID="fEDA80bBc22f2371" T="Image4DFloat" N="Reference" MI="1" MA="1" />
        <IO ID="Fe8C36ea2F188E5A" T="Double" N="Center X (mm)" MI="1" MA="1" />
        <IO ID="1DD3DCf3dd424dA1" T="Double" N="Center Y (mm)" MI="1" MA="1" />
        <IO ID="bDd11FD550b15d63" T="Double" N="Center Z (mm)" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="5180DE616124a823" T="Image4DBool" N="Result" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Shape" V="Box" />
        <SN N="SX" V="250" />
        <SN N="SY" V="250" />
        <SN N="SZ" V="300" />
        <SN N="CX" V="-85.4797803385735" />
        <SN N="CY" V="35.9718135216448" />
        <SN N="CZ" V="-138.623510468497" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="CEede40bc1Df8ce1" T="NodeMaskCustom" V="0.1" X="492" Y="339" FI="Center X (mm);Center Y (mm);Center Z (mm);">
      <Inputs>
        <IO ID="d1aaBbbE2c8CAC0D" T="Image4DFloat" N="Reference" MI="1" MA="1" />
        <IO ID="aCCA7a64f7AC3dFA" T="Double" N="Center X (mm)" MI="1" MA="1" />
        <IO ID="Eab4102302E1aF3A" T="Double" N="Center Y (mm)" MI="1" MA="1" />
        <IO ID="B31dE8Ec4e4C423E" T="Double" N="Center Z (mm)" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="016fA44C313fEe33" T="Image4DBool" N="Result" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Shape" V="Box" />
        <SN N="SX" V="250" />
        <SN N="SY" V="250" />
        <SN N="SZ" V="300" />
        <SN N="CX" V="-85.4797803385735" />
        <SN N="CY" V="35.9718135216448" />
        <SN N="CZ" V="-138.623510468497" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="e8a8FC4EF7aD5A87" T="NodeMaskApply" V="0.1" X="696" Y="315" FI="">
      <Inputs>
        <IO ID="Ead5248e6B3C4B0C" T="Image4DFloat" N="Image" MI="1" MA="1" />
        <IO ID="14BEcBc48CaA87fA" T="Image4DBool" N="Mask" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="7abB1D808eC6fe00" T="Image4DFloat" N="Result" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="CI" V="True" />
        <SN N="VV" V="0" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="BC74cdedb6Ef2040" T="NodeMaskApply" V="0.1" X="690" Y="466" FI="">
      <Inputs>
        <IO ID="10dfFCe533621eAb" T="Image4DFloat" N="Image" MI="1" MA="1" />
        <IO ID="BD0AaAfA84D07Fd0" T="Image4DBool" N="Mask" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="3b0f244ee4e87312" T="Image4DFloat" N="Result" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="CI" V="True" />
        <SN N="VV" V="0" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="E5C5BcBBA5f4807d" T="NodeIORepeater" V="0.1" X="-573" Y="349" FI="">
      <Inputs>
        <IO ID="FA7F1aBF1CcebfCe" T="Image4DFloat" N="In" MI="1" MA="2147483647" />
      </Inputs>
      <Outputs>
        <IO ID="c3bcdAe12f76Eaf1" T="Image4DFloat" N="Out" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Desc" V="T1" />
        <SN N="Sim" V="True" />
        <SN N="SetNewName" V="False" />
        <SN N="IOType" V="Mice.Types.Image4DFloat" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="5aC15bbED5d8adfb" T="NodeIORepeater" V="0.1" X="-572" Y="430" FI="">
      <Inputs>
        <IO ID="Cb1eE5afbf6BbEa1" T="Image4DFloat" N="In" MI="1" MA="2147483647" />
      </Inputs>
      <Outputs>
        <IO ID="cDBb64Cb201Bcf1F" T="Image4DFloat" N="Out" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="Desc" V="FatFrac" />
        <SN N="Sim" V="True" />
        <SN N="SetNewName" V="False" />
        <SN N="IOType" V="Mice.Types.Image4DFloat" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="3F2DcECE00Ff4EEc" T="NodeTransformixProcessor" V="0.2" X="226" Y="514" FI="">
      <Inputs>
        <IO ID="aB65DF0eEbcD28BB" T="TransformixParameter" N="Transformix" MI="1" MA="1" />
        <IO ID="7Ff6DcfDafb55CBD" T="Image4DFloat" N="Resample Reference" MI="1" MA="1" />
        <IO ID="782f20B3D1855Eb7" T="Image4DFloat" N="Image 1" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="Ad611146cC4dE3Bc" T="Image4DFloat" N="Out 1" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="NumImages" V="1" />
        <SN N="UseIT" V="False" />
        <SN N="PFT" V="False" />
        <SN N="IgnoreIT" V="False" />
        <SN N="UseRR" V="True" />
        <SN N="UseCS" V="False" />
        <SN N="FIO" V="1" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="dC8564f8fD08a0bD" T="NodeMaskROIDefinition" V="0.1" X="673" Y="703" FI="">
      <Inputs />
      <Outputs>
        <IO ID="7F4cceEFfF55B6C5" T="Image4DBool" N="[R] Fat Fraction (%)" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="ROIName" V="[R] Fat Fraction (%)" />
        <SN N="ROI" V="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" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="ca53e3FcFC28F8e5" T="NodeMaskApply" V="0.1" X="898" Y="545" FI="">
      <Inputs>
        <IO ID="De8cB23d82F3EE8A" T="Image4DFloat" N="Image" MI="1" MA="1" />
        <IO ID="Bad7DCd7067B1eA3" T="Image4DBool" N="Mask" MI="1" MA="1" />
      </Inputs>
      <Outputs>
        <IO ID="2DDa1eD855bA45eB" T="Image4DFloat" N="Result" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="CI" V="False" />
        <SN N="VV" V="-100" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
    <Node ID="EC0FcDbf352C38CC" T="NodeMaskROIDefinition" V="0.1" X="683" Y="593" FI="">
      <Inputs />
      <Outputs>
        <IO ID="84CCEb0f26AA484e" T="Image4DBool" N="[R] Fat Fraction (%)" MI="1" MA="1" />
      </Outputs>
      <Settings>
        <SN N="ROIName" V="[R] Fat Fraction (%)" />
        <SN N="ROI" V="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" />
        <SN N="RunSingle" V="False" />
      </Settings>
    </Node>
  </Nodes>
  <Connections>
    <CN ID1="86DDBbc8adFFe2C7" ID2="c3bcdAe12f76Eaf1" />
    <CN ID1="4F6F4ee110F6d2c4" ID2="A14A5AA2deeF3aF3" />
    <CN ID1="0BCeb0faBBa2e558" ID2="cDBb64Cb201Bcf1F" />
    <CN ID1="cE6C6045c44dAC4F" ID2="cDBb64Cb201Bcf1F" />
    <CN ID1="eBb3Fe0F0E10CF0D" ID2="c3bcdAe12f76Eaf1" />
    <CN ID1="41D28FCB14dD7bAB" ID2="6a4Ed0F272c4ac1E" />
    <CN ID1="df7edbbaB6C6c6eA" ID2="8f70FbcD6ADdF0FD" />
    <CN ID1="DDeDba258b43347a" ID2="361aa37bBDE0c0fE" />
    <CN ID1="4Fd7EC2ddFA65db7" ID2="e3F0Bc342444Fe5B" />
    <CN ID1="Db2483Bd7bCE8C7a" ID2="EbBdE00cF8CAfc54" />
    <CN ID1="fEDA80bBc22f2371" ID2="Ad611146cC4dE3Bc" />
    <CN ID1="Fe8C36ea2F188E5A" ID2="6cEAE3F02a04FA1c" />
    <CN ID1="1DD3DCf3dd424dA1" ID2="B5dfC31FAfd1ded7" />
    <CN ID1="bDd11FD550b15d63" ID2="586ce38E01315Fa2" />
    <CN ID1="d1aaBbbE2c8CAC0D" ID2="c3bcdAe12f76Eaf1" />
    <CN ID1="aCCA7a64f7AC3dFA" ID2="6cEAE3F02a04FA1c" />
    <CN ID1="Eab4102302E1aF3A" ID2="B5dfC31FAfd1ded7" />
    <CN ID1="B31dE8Ec4e4C423E" ID2="586ce38E01315Fa2" />
    <CN ID1="Ead5248e6B3C4B0C" ID2="c3bcdAe12f76Eaf1" />
    <CN ID1="14BEcBc48CaA87fA" ID2="016fA44C313fEe33" />
    <CN ID1="10dfFCe533621eAb" ID2="Ad611146cC4dE3Bc" />
    <CN ID1="BD0AaAfA84D07Fd0" ID2="5180DE616124a823" />
    <CN ID1="FA7F1aBF1CcebfCe" ID2="14c28EdACd4b114C" />
    <CN ID1="Cb1eE5afbf6BbEa1" ID2="adD1E4dfB07Ef444" />
    <CN ID1="aB65DF0eEbcD28BB" ID2="b376Ad5ef5dCdEC5" />
    <CN ID1="7Ff6DcfDafb55CBD" ID2="c3bcdAe12f76Eaf1" />
    <CN ID1="782f20B3D1855Eb7" ID2="cDBb64Cb201Bcf1F" />
    <CN ID1="De8cB23d82F3EE8A" ID2="3b0f244ee4e87312" />
    <CN ID1="Bad7DCd7067B1eA3" ID2="7F4cceEFfF55B6C5" />
  </Connections>
  <Notes />
</MICE>