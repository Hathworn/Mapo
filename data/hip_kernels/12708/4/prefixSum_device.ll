; ModuleID = '../data/hip_kernels/12708/4/main.cu'
source_filename = "../data/hip_kernels/12708/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9prefixSumPiS_S_iiiE5tmp_T = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9prefixSumPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 10
  %10 = add nuw nsw i32 %9, %7
  %11 = icmp sgt i32 %5, 0
  br i1 %11, label %12, label %166

12:                                               ; preds = %6
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !13, !invariant.load !14
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %7
  %27 = add nsw i32 %4, -1
  %28 = icmp eq i32 %7, 1023
  %29 = add nsw i32 %3, -1
  %30 = add i32 %8, 1
  %31 = icmp eq i32 %7, 0
  %32 = add i32 %7, -1
  %33 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %32
  %34 = icmp ult i32 %7, 2
  %35 = add i32 %7, -2
  %36 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %35
  %37 = icmp ult i32 %7, 4
  %38 = add i32 %7, -4
  %39 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %38
  %40 = icmp ult i32 %7, 8
  %41 = add i32 %7, -8
  %42 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %41
  %43 = icmp ult i32 %7, 16
  %44 = add i32 %7, -16
  %45 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %44
  %46 = icmp ult i32 %7, 32
  %47 = add i32 %7, -32
  %48 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %47
  %49 = icmp ult i32 %7, 64
  %50 = add i32 %7, -64
  %51 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %50
  %52 = icmp ult i32 %7, 128
  %53 = add i32 %7, -128
  %54 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %53
  %55 = icmp ult i32 %7, 256
  %56 = add i32 %7, -256
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %56
  %58 = icmp ult i32 %7, 512
  %59 = add i32 %7, -512
  %60 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9prefixSumPiS_S_iiiE5tmp_T, i32 0, i32 %59
  br label %61

61:                                               ; preds = %12, %163
  %62 = phi i32 [ undef, %12 ], [ %149, %163 ]
  %63 = phi i32 [ 0, %12 ], [ %164, %163 ]
  %64 = shl nsw i32 %63, 10
  %65 = mul i32 %64, %25
  %66 = add i32 %10, %65
  %67 = icmp ult i32 %66, %3
  br i1 %67, label %68, label %166

68:                                               ; preds = %61
  %69 = zext i32 %66 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !15
  %72 = lshr i32 %71, %27
  %73 = and i32 %72, 1
  store i32 %73, i32 addrspace(3)* %26, align 4, !tbaa !15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %31, label %76, label %74

74:                                               ; preds = %68
  %75 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !15
  br label %76

76:                                               ; preds = %74, %68
  %77 = phi i32 [ %75, %74 ], [ %62, %68 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %31, label %81, label %78

78:                                               ; preds = %76
  %79 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %80 = add nsw i32 %79, %77
  store i32 %80, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %81

81:                                               ; preds = %78, %76
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %84, label %82

82:                                               ; preds = %81
  %83 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !15
  br label %84

84:                                               ; preds = %82, %81
  %85 = phi i32 [ %83, %82 ], [ %77, %81 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %89, label %86

86:                                               ; preds = %84
  %87 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %88 = add nsw i32 %87, %85
  store i32 %88, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %89

89:                                               ; preds = %86, %84
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %37, label %92, label %90

90:                                               ; preds = %89
  %91 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !15
  br label %92

92:                                               ; preds = %90, %89
  %93 = phi i32 [ %91, %90 ], [ %85, %89 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %37, label %97, label %94

94:                                               ; preds = %92
  %95 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %96 = add nsw i32 %95, %93
  store i32 %96, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %97

97:                                               ; preds = %94, %92
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %40, label %100, label %98

98:                                               ; preds = %97
  %99 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !15
  br label %100

100:                                              ; preds = %98, %97
  %101 = phi i32 [ %99, %98 ], [ %93, %97 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %40, label %105, label %102

102:                                              ; preds = %100
  %103 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %104 = add nsw i32 %103, %101
  store i32 %104, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %105

105:                                              ; preds = %102, %100
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %43, label %108, label %106

106:                                              ; preds = %105
  %107 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !15
  br label %108

108:                                              ; preds = %106, %105
  %109 = phi i32 [ %107, %106 ], [ %101, %105 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %43, label %113, label %110

110:                                              ; preds = %108
  %111 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %112 = add nsw i32 %111, %109
  store i32 %112, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %113

113:                                              ; preds = %110, %108
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %116, label %114

114:                                              ; preds = %113
  %115 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !15
  br label %116

116:                                              ; preds = %114, %113
  %117 = phi i32 [ %115, %114 ], [ %109, %113 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %121, label %118

118:                                              ; preds = %116
  %119 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %120 = add nsw i32 %119, %117
  store i32 %120, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %121

121:                                              ; preds = %118, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %49, label %124, label %122

122:                                              ; preds = %121
  %123 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !15
  br label %124

124:                                              ; preds = %122, %121
  %125 = phi i32 [ %123, %122 ], [ %117, %121 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %49, label %129, label %126

126:                                              ; preds = %124
  %127 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %128 = add nsw i32 %127, %125
  store i32 %128, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %129

129:                                              ; preds = %126, %124
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %52, label %132, label %130

130:                                              ; preds = %129
  %131 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !15
  br label %132

132:                                              ; preds = %130, %129
  %133 = phi i32 [ %131, %130 ], [ %125, %129 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %52, label %137, label %134

134:                                              ; preds = %132
  %135 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %136 = add nsw i32 %135, %133
  store i32 %136, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %137

137:                                              ; preds = %134, %132
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %55, label %140, label %138

138:                                              ; preds = %137
  %139 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !15
  br label %140

140:                                              ; preds = %138, %137
  %141 = phi i32 [ %139, %138 ], [ %133, %137 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %55, label %145, label %142

142:                                              ; preds = %140
  %143 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %144 = add nsw i32 %143, %141
  store i32 %144, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %145

145:                                              ; preds = %142, %140
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %58, label %148, label %146

146:                                              ; preds = %145
  %147 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !15
  br label %148

148:                                              ; preds = %146, %145
  %149 = phi i32 [ %147, %146 ], [ %141, %145 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %58, label %153, label %150

150:                                              ; preds = %148
  %151 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %152 = add nsw i32 %151, %149
  store i32 %152, i32 addrspace(3)* %26, align 4, !tbaa !15
  br label %153

153:                                              ; preds = %150, %148
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !15
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  store i32 %154, i32 addrspace(1)* %155, align 4, !tbaa !15
  %156 = icmp eq i32 %66, %29
  %157 = select i1 %28, i1 true, i1 %156
  br i1 %157, label %158, label %163

158:                                              ; preds = %153
  %159 = mul i32 %25, %63
  %160 = add i32 %30, %159
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %161
  store i32 %154, i32 addrspace(1)* %162, align 4, !tbaa !15
  br label %163

163:                                              ; preds = %153, %158
  %164 = add nuw nsw i32 %63, 1
  %165 = icmp eq i32 %164, %5
  br i1 %165, label %166, label %61, !llvm.loop !19

166:                                              ; preds = %163, %61, %6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
