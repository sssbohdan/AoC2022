//
//  Day3.swift
//  Algorithms
//
//  Created by Bohdan Savych on 03/12/2022.
//

import Foundation

enum AoCDay3 {

    static func solve() -> Int {
        input.split(separator: "\n")
            .compactMap(findRepeatedCharacter)
            .compactMap(characterValue)
            .reduce(0, +)
    }

    static func solve2() -> Int {
        let backpacks = input.split(separator: "\n")
        var chars = [Character]()
        for index in stride(from: 0, to: backpacks.count - 1, by: 3) {
            let backpack1 = backpacks[index]
            let backpack2 = backpacks[index + 1]
            let backpack3 = backpacks[index + 2]
            findRepeatedCharacter(between: backpack1, and: backpack2, and: backpack3)
                .map { chars.append($0) }
        }

        return chars
            .compactMap(characterValue)
            .reduce(0, +)
    }

    static var lowecasedCharactersValuesDict: [Character: Int] = [
        "a": 1,
        "b": 2,
        "c": 3,
        "d": 4,
        "e": 5,
        "f": 6,
        "g": 7,
        "h": 8,
        "i": 9,
        "j": 10,
        "k": 11,
        "l": 12,
        "m": 13,
        "n": 14,
        "o": 15,
        "p": 16,
        "q": 17,
        "r": 18,
        "s": 19,
        "t": 20,
        "u": 21,
        "v": 22,
        "w": 23,
        "x": 24,
        "y": 25,
        "z": 26
    ]

    static func findRepeatedCharacter(in string: Substring) -> Character? {
        let firstCompartment = string[string.startIndex..<string.index(string.startIndex, offsetBy: (string.count / 2))]
        let secondCompartment = string[string.index(string.startIndex, offsetBy: (string.count / 2))..<string.endIndex]
        let firstSet = Set(firstCompartment)
        let secodSet = Set(secondCompartment)

        return firstSet.intersection(secodSet).first
    }

    static func findRepeatedCharacter(between a: Substring, and b: Substring, and c: Substring) -> Character? {
        return Set(a).intersection(b).intersection(c).first
    }

    static func characterValue(for character: Character) -> Int? {
        lowecasedCharactersValuesDict[character] == nil
        ? lowecasedCharactersValuesDict[Character(character.lowercased())].map { $0 + 26 }
        : lowecasedCharactersValuesDict[character]
    }

    static let input =
    """
qFdBBvtHHfvRlfvsqldvqjPpQmnQmjnjjjTRTLGRNG
ZCWhhCsJCzSJzSbzgsmPTGNNPPNGjgLTLjgn
WJZsbJMwJcszJcScwhVltFwBFBlqddvFdHDfqq
crtTsGTtqFThGQGCrsjTwdNJwpRdnJJwffRClpSf
PWVBPVHLvHHVgvZWBzmPpnfRSJJRQnSRflRPSNSl
gmzBzDgzmZQWLDLLgVmDrqGhsscrqDMGhcqtqcFr
HsbcdVrsbVbcLfPqqQsqqtPj
mMBFzZRnmFMRBDnDFBGZDGdDqLjtdQtPtgfPfttgtqgq
BZvZZdJMBFdJhSvhbhchcHll
GNRSqRfcNTpfGCcqjfzBpDQPWBzgDpQsPWzW
rrSdnVHlbMdLdBDzgtBtBmQt
rbFwwnLFLFwlMLrFwFhMVLrGNSTfZTRhfTqjGJRRZTCNcf
QWTnQCnWNNWmTnSPQwmqDbcscbpcjPjVPbrjpq
vJhzZNlNNgdzgzJdlGzHHcHDpjsHqrvbVrbvrD
RzRdRlhLgtCwCWSLnN
SFTJFTTwTVVSJBnSTdvNNfWbZCZWNZCNNhBv
srLrcHDcsjtLcLLcrLctjlcvbDNhmWCvNhZWGZZhNvhZmb
rclgtMPrrSgVTgJCng
DbrhDzcDffbzNbZvZWSSqSTNSVWv
gCPltPmCPglFnPFwtGPhGPwTCTdZZWZVRvWqdRqVVdTdvR
hLBhlmlstcffBzrpfj
wFLLmhMfwZLDwmMNRhZwRLDvJgldbJHPdQvcQHHJQPgH
bjrVrTSSJdQHcVll
CGCSsCCBpspBrqbSttpbqWmWZRmfFRZhZMNNLFqFLm
zWGjjBHGjzzTWMjhtDDWtPPlJZPJpvqQrmZTqQQpmr
RFbVLcBVLRcRVcCsCCqvpCZqmplqQJmPrlvQ
FLNRRSSRgScSVLLLNdFdwjHjnftBtGMgMjzHgzjWjj
znVSqnqbqzSbzTHqDDZmlcFcnhDMnDmn
LtjsvdvLJdjfFwRRCCMlChwCpMcclCcZ
LgvjjfjFQVgNTgWq
SJRJRFFCMSsGRMMwtZJRCVTgqgTVgTBCVpjTjmmWlB
ccvnnpnDVqTcBVTV
vPHprdHdpnzHSMsSrMRZJGws
GddGrcGNHnGvnCHddvCSWqTSWsTwTWShbHlhhb
gDPzLRVZgQfpRRFQDDVFDfzhSzsTBqqqnqbhnWTSSlST
QVFfFgRQQgLtgffZRfpFPfntjrcrjCmtCdMMmjMdJJJNtm
jjmNcpGCNmDqqsBfnZnGGGRLsZ
lrmlVWlQQtWllgtbQVrWBnZsJgsRLfZLhZBBBffL
rWMVQtrFlbFlSSMHVSdHHNHdcdDcddzppzzm
bTpjpjcVTLmphbLppJwqzqwJLqqzzzgRLJ
sdHNbrvNHrqPvZZZPRww
bNQCrCNtNsSlhffhVhpVWFCW
lpNnpMMZZDbNbnBjcrbjvScFmbGj
wqhdqVqdscrjdLsv
HQftVqWCfhwqtCCjWwfqzzVPZRJQgMlggZMMMZTNMNTnNRTN
fvvGbFtVmtTwgtMT
WcCcClzPCCcczJJScPWWZzBDmwbhBBHSghgDDMTHMDBD
nWPljWzZWnbcbRsNFjFFdFdVjFsj
NQrcLNmQGRfGLHHLZgbbnpjZJJJndbgnlv
DWtThDWtzzhltWTwjbdpvjbgqjgg
VtSPFWtBPBFSFBWCStshWBmlRfHfMRcfQLQLLlmCrCcN
pbmwqJnqSJVwwDPCjZZzrZfD
QtssBTvNdNvNtQvQGpGhdjPjDjczZDfjhgPPDcgjgr
GltptQpMGNNpRWlWFVFHJFHLWH
ZLLsDGGVhZcQQLhrLshrVFwHnWqJnWMnJJJnqfWfGn
jMlPdTlPlgCgFpngFWFnJfpw
TlTNbdSSTSTmTjPMTCdBPjBMrLDczsZcNrDhRNDRQRLLRVVz
HDLpBqDVVTvwGDDNRT
PlVWjfhsPMMmWtlFNTrhrrvCCCTNNbvw
lsglfgVJmsfMjJfSqSzdZnLgqcnLnp
pfCDJWBpfDffpJLgQJzzVzNrgNgNgNhNzmVr
ZnnGZbGTPZnsnRFdTlbrwdrNzrrmmWwmwVwttH
GbPGRvTnZljWnpqSMMCjqJQSCf
ZgnFgwggznFrfrwfHhNMMr
pctLCLRhPHBLMLWfBL
JJcdJcQCCJmQJppmlgndnFslsVnsvghZ
WpMgTppWGSWWJmJDpJcJJhqm
zZzjZNHvNjPvNsbZLbRLzsPcqhVJSVttdwhwmdRhtdJRVd
sLbvvCZCPSSSbbPfNlQQTQGBllCTnMnWQn
fwbwswddwSbBfDBggMBPDPhHcPWDmhHhmWnWPC
FQFlzLCzQTlrTTzvltFqFrmhPHjnhhnnchcJWcRRmRRq
lpLzlFZzCltrTNlTztQLZfSMGBNdSBVwbBNVSMSbVs
FMmgbTFdgLSgFQdjrRPrQBPDdj
ZqqWRvsfGrrPvvPC
wZzwnqccRwRNNpRSMztSMMFbgzLTFS
qTwBPfTfqQDMDrssHdvtRHccHMjR
gWSZGWzGFhnFFgnhNsRHtRdsVjZcRjHs
jgplhpJJFgnDrrwfqprwDP
CWhMSRfWhVVnRSZnVVdsLQqQMzGqLBvGMQqczv
PHbpNwrjJplttvcclLlQzzDszc
NrJbJrFNNJNPrmwrtbjtNmCfSWfWhSZZfSWCsfShfFVR
VLhRPLGLRPRSStRRLwfGqfmDwbmqbqqDlD
rBSFvppnzTbwDwlDcFWm
MJrnJTMvMsrTsPtshRNPZdSLhL
BZBrRCrnCQBBnZfGqhGGMMRcthMhMG
TLjsCdDCPTvNssjdsPsDgsgqGcPHczchtHczWzPWzzlWhG
gsTpsdNbvNNjNSpsNDTsmCnSVQFmSFwZnQBnmnQQ
llbsNsWrmbrGbWCNtBjcCFBzQFZBCFjF
LdSpwgdqSgzwJdRdLMRHLjQQjHjFHctjHBDTZj
gSppgpSJMhpzwrhblfbhhlWlnW
DwhTvvsJZWsBnDzPpBLbFp
GHtNGRGNdzbMBBtmBt
NljlCSVSHdjGSQRGlCQSCswqfWzhZfTcfzcJvshJ
lmsGNFsDGqCbFQBbffjjwpzptw
hRQdvdrvrvSngWnvnHrTMfzfzRtftzwVTwwpzB
HnSSWrvLJvWJGFDsmFLPDFcQ
bwwpGphpLghpTvpWphvJlFLJqqltjSjVlSStSR
cmszZdDdBZzcNcDCDcNsmNMcqVjMJStFRJltVPVrlVPjVJll
HcdmcCzzzQcHNcsCdpnGnhwGgnRggHvbbR
CfMBbwBGbMbDCFrDvhFFDT
mjzRjjRdSmjPnzFZgnnrTT
cmSsVcHjLHTwMfLBpBpBwM
whqqfZzgHvhSzzVNVDbpDbmbVbNpJD
GcQFntGTCCcCTMCTGBlJsJsDDWpRbWBsJpNS
FnPcrGFFdddMnCnTqgqgqPHfLjLqgSzz
zMSzzjssFdGnszRtNftqqwFHbbZw
RRPLVrgrwHqBqgwt
rPWmLCTCQlCQQmmrWLrQShJshhzdhhJjcSjlzRds
lvgvCDfPqLHppqpCCDJncbntttbBtBBVHjwtrB
TdddszSQsWcngjzVbcVZ
hRWsTRTGQhNRGhRTFSWmlpgfqlvLmplPqvvGgv
LbWFLQdWWPwWSjSHPHRfppHHDRpggR
zmqqNNzlzmnzzNCmVCmtBzpfGsfpBgDgspprcfcfsrRB
qNNVNJtNmmmNzznVJzvCTDZWhvZZjZFbWQQhFhbZSw
DjdHqJVVhHVZjhDHPWtDtZLFBRBFmSRTFSbwmRRTffTTJf
NNznnGlgMQsnQzNclzpfSRSMRmfPMmFRwBwB
vzrcGcNcPPvHvHPt
wLCcmZwWTNtZNdMSMGSCnJGGMB
RFbHsPhVvFPRjlshhrnQnGjQGSdSqJfqnQBM
HhzVlFHhPwzScmSTgL
TNlBhDNvNBFpJgpPPpDQ
jjfCdCZZqsCZsbdqPgFGGMRzSFMqQMRS
jnWPtWssCtWcmZbbtstvnrrvhVBhTNNhBHlBlL
DZwNWPDzPVWbJngrQjrNnrQcMg
GRRfttLBhhvTvmLmFcFcgFFSnjWrnsrG
TLthBWtTRLHqhlLLfmhBqVPDJVdPwzJCPPZHwdDdVd
GGVhrVSMQwQqfVssVvnWFgvgWn
jtlcRBBtQRmpWsjzFCvzWnvF
QPcRbpppDmNDtPPblZMfhZdDwdMrqSSGrq
ZRrdtBdQvQsWnnfWFZsF
bJLcMzNDLbMgwfnGMWFv
lpvhmzNDmDmlNbzbmrVVPrHRCPHQBVCP
rZllQrsRWrlQswccMVbGbVbTdcQQ
NtJCntLSHCjznfLTcGGGqWMdWM
jCtzzSFthhSSSjPJrFDlvWrlDZRpwpRZ
mQmbLjbrLQjLmTtwwWBTTvWjtt
BHSqdHclHHNFlppNqWPwfwDvTfDPPtCw
ddSGMGHcdcMhMZnBbmbZmgGJJg
lvvBzvDnlzjfPnfjnQPlldRbVbRqbqqCgsqqVpQQgVqc
NNFtGNMtTNFmJNGNZtZMwVRTTcsCpVTbbgCbgRhscp
FGNGZMtNLWmmJWGFWJGLSNtPrPnBfDzzvjnDBzpnvDBLnv
fwvQRFQvQqwpwNJrwN
BstDnBjhjBhnshSptpJzWqNppbfr
CsDjCdZcBCDcjnfDHfhnfggZMGlgQVmgMTRmgVGMMl
MwlBVqVlsgnmzwJsvjhWZhGPvjvRRWzG
QNQpQpftHdHHCHGfSpCrQNdSrDRDhchhjvjcPrRRWrPvhZjv
LtLSCTSGfHGdGwswnqsggssTqV
qDDCHjzjznTvWshZQWfnZZ
PFFmmNMMtNMVFtczcFPJNrLhZwQZQsSvvSvWvGQQJQssss
tFzrrPPNNFlzVrpRTpblRDqjTpDC
DWDrrBdpmdpBrCgDthdtfcHsqJsCqscqwfsjzHcq
TNLNFNSTQNQTSnlMcczVJjVzsqLDDfJJ
TFPZQRvvlMSPPtRWDtmDRWrBGr
LWGVZdrvWdpLGWRsjPMsHmdHdHldlj
zJzznChzzzCSfTgMhCPDmlDCbmlsmjDDQj
nSTTJhJtnShNtzwhgNrGRRWZZRvMWMtVrqGp
PbPmtNmBbPlqBvqlDJBT
LpGVDzVpVZqqSTvq
pMnWGLRLRppnGpGndrGPtgDCjMPmbPgCQmPPNN
sqcZcbZZpcZspcCCRMmznWGWdLWhwDRGTTWggT
NjFSJgVHrvfVtrGzWdSznDwLSTLn
jFrBNVVjBFNvHrFHBlBFFpMslPgPcpMPmcQPPZCgpP
frddqsThtsTfTbPcvhsrbsRLpRBNRpmDpGmRGcRNLpGp
QWJHCJwWzlHZQZHQCJJRzRqnLDGRGpnGBRnNDN
CVwHCClJjQgWCZVZQgMwSdthjrqvrSPPhdbqtPhs
TvdphBBhhhCgdLNNJJJLWz
fVcsqRVrPcnJWgDnJN
JlqsRJtssZwqwVtPwltRPsHHbFTwTFbpjHhQjTQbvpTF
cQSnPDDQJGNzwnNpZb
RHDrssVRDHRgsRFHRlrVwzzpNGZlfZdppZdwGNZb
sHCHtDgtCjVVLFChqPMhBCMcSTqB
hdbQbqcCCQcqFbCbVdcWCQQlRMBtGlRHBtBMpHhpHThZMR
LLsSLLfgJPrgPnssnmlZtlZpHGHVGfZVtZpl
PvmvgmvvnzmrSsSLJDqDNzqFDQdDwzWWbV
HNNjnLbpLGHvWJDhdWWPpWDW
lVcSNgcSVclhRlPZPRCDCR
cqmSQrwwrrVSrtQFqVNmFwjQnvjHzBbLLGjfjzHTzvnH
QmvWVppPHQQvbbvmSHSpPzfzwnWMTZFFzwFMCzLnwT
jGBljlNNjgDtGDrNjjtjqqDRnMzRLnFzCFnMfRfMzCnttF
jqNrrGdJcdgLjqDqBrDQbbmhdQQmmpPbphmbVv
ZHQCggVHHRDWvbfjGptVtLvL
nnFwnwrDDMShnhFrFLLLpjvPlPGGtLGb
dcNSMhrrTDCBCsWgCTQW
HqDDLGtDdCnhfDnwnV
PmlJsJTPlbdBTzTnzhnnCCWWzV
lSPjMScggsScgjSMMbqHLFGrRLGHRZZtdrcG
ZVVtNNppdZSdLtCPqnHhqJJFtb
zgwwQBfwmGgSrDfgrrGBggzHCnbJbqbCJFnqhHBhnHHCqJ
rvrzfmlRrgDgmrzfggvwzvdjjcccLjMjVcVcsVLjVSZR
dppcLRHpphchhNhSddjzHzWQWQLtrMsrWQCWCsMZssCZ
JGfBfJJfBqvGVlVbDBwDBDBfZnrQsMQtssMttssDsQMWZncn
qPVwlgPBmjpPhcmS
zGPnzBgPzPnPlHZlDDHnZBNCvrtcjcjmMcFzNcNFmFdc
qQpfsLTTSspqTfJdmdCtMjdtjvJcmr
bfQqqSrswLLrfpLTqprfTnDVDVBBbgHPDHnhDPgDbV
JssTnsdFztZLdNJnNtTsLNZGqlbGFBqrGMHqHBcFBqMFMH
CCgSfgPSvSfhpShSRppCdfrlqGHGGcHmclmqbbqbqlPc
wvVSVjQSSQhRVvfQChvZZsdtJstjLNLZDJnLss
CmfNNNZNqDrnDjMhZM
gdczzGtdFcddtWQgGGMnVhnjJwnrJFDPTwMP
dlvcdzdHtzQSLRSfmhLSqv
ZpFFLcHFZZRRmJVZgD
PzhrtQntzcrjCRJtbtRgBsBRVR
zdzWfCzhQzlhWfWhlvpFNlpSqcMSHHMv
NrrMgMhNQhNjQrtqtPtwVtZpggPw
TfRLndnLFCRFTFbbRDHwpVqqBBwsHwZsfH
TJFRdLlRThrlcvZcvQ
scrwRVjbQvQBzsBC
gMfVqNnVmnCBQDTvdn
SMqhWqVlmWSmqMVRSJjjpcFrcLpJrR
HtSQHQntHsHMrtHnGfHQVVzLvSBSVvVVSFNJzzVN
cmPRmpqlpPmcgTlTpjJNjjVDvDRFNVVBFD
hlmCpmqmpgqpZTlcdQHFQfbHHZttwMQwtr
VpWgbgfwCjbftwVPPpGQFQhzTBQTBGPzqFTS
dbRbDcRrsnsRrLZmLRDZldDZqTNTGqqFFzGGhSTNTFTzNmNT
MlLdHlDDHrHclMMrCwgHCCwWwCbCCjjg
GGNLhfDMVcVrcGsT
jSJQFjHbwPFSvQSHwZFvHSHrqCCrrTsqBwNBrcBNsVTsqq
QjZSjZJZPvNRZJQPnSZbJZRWLfnmgDlmhdhWgWLdMdfmhM
CgGnzPNggCJtNTgTZTPZzZZvvcDcDDdqDFcJssJDHDqvHq
jhhrrLVlmLRRnRflfVbFHHHqdVsDqcvbHVDb
jWfWwrlmRRnQmPzZNGZPBNCQTB
NzDDhwNmhvtrGmNCvWRVbcRRVTcHHcVFTbwV
LgsPlLsQgQdJsLdldtpgFFTMbnFqTcMbHqFcPncq
dgsJsLLLggljrhtGNNtSjvGm
ptzSrZtzhsmmtPrhLFRFnjnnLMsnfLRL
HvwVDHwWWgGDGdHgqVDWDMnRnTjFNTNjfLJvRRRRRR
DwDgWgQbDDDHwBBBWdwQGVHhlhlZZSSmztfcppSBhzZcZp
CWmWRzlMJqWDWqCJbqDlCBBVLMQHVMGrfMVtQZrsLL
SnhPdFFPNZsBBdHtVQ
SSPcFFgnwnSpwvcSjwzCqRzTmJbpJCRBmbbD
wQbqGWWSqwrbGWWWGjbNMJPfgfnnDmPnPNLfjN
tJFztRZCvVRCztZFZRVgmMhmgNLfRfnmDPNPhm
BFCVZzpVFlHCdbQqcTcGlJbbSG
tttfLPZZQZTlZPHHPWgMVvBnjmvjnjgGBQ
FzcNDDDrNzprrrshprhFJtVGVnjtjGvnhvVnnjnjGM
RDqJNszDPfdqPtlT
QCJdMjCQbdBjSbTHDsbWDDwHTP
zlvlmqzqGfgdNzLldrHwwPGpWDrPGZWprr
gfVfRczVqcRzmdcSQMjQSQCSjQCQ
RhhCGhRBShjjRfpwppFTfFHZHZZD
qzdqzlnPPctPdmtPdTZbwQvvwqvHHvZpwZ
nVTVTcsWmWSRhhRVrGVB
GmshRMnzqRGsPNwMwcrrpcVV
CDCbFCLvCgfDSFLslgDpwpLtTwwcPtNNtTTprt
JvSFbSbbFllJlgDvlJbgdRhRdqzBGnzshZnRRRnHBZ
ShJhtcsvvvQbnnsccVTLVTppWqddpVnLWp
NdzPrPZgPMNNrmzpTzpTCjWfzCpzVL
dZgHmZRPPZRlZmrPDtDRccvbtQQbJbRS
wqjLjwhznhBLqLWGfvSlvcmlrJsqrtJTJJ
PwbpFPQDRCDrDJTrTmvs
gbZVFbZHgwHbCdpCRMnffNLhWnnzMdzLLW
RVVGSNTTRlNqHblBNB
JfwJMvLLZwLsMJwWMJfwLHBqzFlvzpBQcqzblFbBqblq
wMCZJsgJCCCnsMHrgLLjSPSVTgShtRjTPhRRmt
lmQSSWdMHHLWgWqD
ZZtVGGGJrJvGVCwfgHNLccmNFFcqtc
vrCGPhvrTPdRBnsRTmmp
dDMDDjzCQjwCCcDgjSLLLsLNlmpplN
FqrHFTFRLCLVFBmS
JhHJhHRThrfPZPvhnTZZbWdwdwDDWtDzJDtbMtCW
ghwDzJRDwHmPthncSPncLLsPcvnv
MWCrNTCHrMVjQQMQcSdnpTLnFFdTcnTc
qbWMfWfNrWVQWfbjVBbqMfwDtqzmhmRRzGhtHhHhRwZh
fmSmnjTjrlzGlTzJdH
BrhRRQMrgQvgFFhQQbwpFvGGdZqZJqpJqHVpJGJLHdLJ
ggbDwQMsvsMQrFMFcWSPSCPmSsPfnnmP
cmNVbMrrrjcHDRcvfW
wQGdFfSThFsLhhHWvDCWDCJRCCjd
LtpStGhqrrpnfnpp
bvcccTqbgvpGndJtgdsgNd
wDQwQhtQhQRmSmjsJndJdBBJBJnlLS
hwhmRrzFVjtwzDmrVFrvPCcCMVPPvfqpCCTVVb
jRrRNPNRWjPRWPRQNjQjThTCzBBzDCFBGzgDFGGQ
dnppLwmwCnvtlqltvtnTGBThGhdFZhgzDzGccD
MvnqpLlMqCqCHMjWPPHMSHSs
NNpNNvpvBdtTrMFFMhSSwzjzchzwhzwL
VVndHqflQZZZgHSLLhjzRSmZRhcR
glGgnqbQlngnWCGJpJprtrtFrdPPGs
WqwRjzGtRzZZRRGjWBJzjwmfMTHGGssTTDsrLmmmQLMD
SNdvSdFlSNNhSPFFcPFclbQQslHmfHTDsTQMLgDTmHQQ
CNcCFvpdnWpjWwJf
PVPnVHcnRncGZqbVzHVPnnLbSMjwrzWMjSwDtWwWtwWhwDWz
pTfsQCshCllpglWWSjBMSQSrMrjM
hvpvppggCpJTvTmshgfsmZRRHqbcLPHZmPLRnmPZ
LQbhVZZmZhZjBdbGmgHqnHTmvqgnnWHr
SzCfDFFNRfsSFFMFfvprvpWzqzgqTwHTvp
CDNDFJgMDSQhjVdPJLQG
plpdLdpjjrrHJJjLrrHLFdbzzCcvzgFgcwggzPMFvvcMhM
GRtSBQNsQlMPRzRlzw
ZSTtsmBlmjLLpnpH
hglGNVSdNSghzSgCBhDFLBMBtFMMFtHtbtLL
frQZccRcqGFmFHrJ
nvfGZwvTwGTfQwvfTwfgnCSlpdnzgzslppCsCV
snTSPbQnTTnQgbmsTJsLfZwjffhpLnGRjpGfjL
dcNWcNHHlNtWHHlCtltWNFNMLZwjpGfpmrZfrFprrRGpwZfp
HmdNWCmDMVvQPDgqJs
GGFtSngQLfnSnQffgPnRgFRGRwmRJvwbBbJDwjvTbjrwhJvJ
WHClslcNNWcqNWlCZdcHsVrThBwBjbhDTDBhrvDZJTwm
NWVqqcHHNpsNcNVdVlhCMlHQQMQQzLfzQPttFGPMLSLgtF
"""
}



/*
 One Elf has the important job of loading all of the rucksacks with supplies for the jungle journey. Unfortunately, that Elf didn't quite follow the packing instructions, and so a few items now need to be rearranged.

 Each rucksack has two large compartments. All items of a given type are meant to go into exactly one of the two compartments. The Elf that did the packing failed to follow this rule for exactly one item type per rucksack.

 The Elves have made a list of all of the items currently in each rucksack (your puzzle input), but they need your help finding the errors. Every item type is identified by a single lowercase or uppercase letter (that is, a and A refer to different types of items).

 The list of items for each rucksack is given as characters all on a single line. A given rucksack always has the same number of items in each of its two compartments, so the first half of the characters represent items in the first compartment, while the second half of the characters represent items in the second compartment.

 For example, suppose you have the following list of contents from six rucksacks:

 vJrwpWtwJgWrhcsFMMfFFhFp
 jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
 PmmdzqPrVvPwwTWBwg
 wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
 ttgJtRGJQctTZtZT
 CrZsJsPPZsGzwwsLwLmpwMDw
 The first rucksack contains the items vJrwpWtwJgWrhcsFMMfFFhFp, which means its first compartment contains the items vJrwpWtwJgWr, while the second compartment contains the items hcsFMMfFFhFp. The only item type that appears in both compartments is lowercase p.
 The second rucksack's compartments contain jqHRNqRjqzjGDLGL and rsFMfFZSrLrFZsSL. The only item type that appears in both compartments is uppercase L.
 The third rucksack's compartments contain PmmdzqPrV and vPwwTWBwg; the only common item type is uppercase P.
 The fourth rucksack's compartments only share item type v.
 The fifth rucksack's compartments only share item type t.
 The sixth rucksack's compartments only share item type s.
 To help prioritize item rearrangement, every item type can be converted to a priority:

 Lowercase item types a through z have priorities 1 through 26.
 Uppercase item types A through Z have priorities 27 through 52.
 In the above example, the priority of the item type that appears in both compartments of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s); the sum of these is 157.

 Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?


 */
