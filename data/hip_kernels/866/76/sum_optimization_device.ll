; ModuleID = '../data/hip_kernels/866/76/main.cu'
source_filename = "../data/hip_kernels/866/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16sum_optimizationPfiiiiS_iiiiii(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !6
  %22 = mul i32 %13, %18
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = udiv i32 %21, %18
  %26 = mul i32 %25, %18
  %27 = icmp ugt i32 %21, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %18
  %31 = icmp slt i32 %24, %10
  br i1 %31, label %32, label %42

32:                                               ; preds = %12
  %33 = icmp sgt i32 %11, 0
  %34 = icmp eq i32 %9, 0
  %35 = icmp eq i32 %9, 1
  %36 = icmp eq i32 %9, 2
  %37 = icmp eq i32 %9, 3
  %38 = and i32 %11, 1
  %39 = icmp eq i32 %11, 1
  %40 = and i32 %11, -2
  %41 = icmp eq i32 %38, 0
  br label %43

42:                                               ; preds = %98, %12
  ret void

43:                                               ; preds = %32, %98
  %44 = phi i32 [ undef, %32 ], [ %99, %98 ]
  %45 = phi i32 [ %24, %32 ], [ %100, %98 ]
  %46 = sdiv i32 %45, %6
  %47 = mul nsw i32 %46, %6
  %48 = sub nsw i32 %45, %47
  %49 = sdiv i32 %48, %7
  %50 = mul nsw i32 %49, %7
  %51 = sub nsw i32 %48, %50
  br i1 %33, label %52, label %98

52:                                               ; preds = %43
  %53 = mul nsw i32 %46, %2
  %54 = mul nsw i32 %49, %3
  %55 = mul nsw i32 %51, %4
  %56 = add i32 %54, %53
  %57 = add i32 %56, %55
  %58 = mul nsw i32 %46, %1
  %59 = add i32 %54, %58
  %60 = add i32 %59, %55
  %61 = mul nsw i32 %49, %2
  %62 = add nsw i32 %61, %58
  %63 = add i32 %62, %55
  %64 = mul nsw i32 %51, %3
  %65 = add nsw i32 %62, %64
  %66 = sext i32 %45 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %5, i64 %66
  br i1 %39, label %68, label %102

68:                                               ; preds = %150, %52
  %69 = phi i32 [ undef, %52 ], [ %151, %150 ]
  %70 = phi i32 [ %44, %52 ], [ %151, %150 ]
  %71 = phi i32 [ 0, %52 ], [ %157, %150 ]
  br i1 %41, label %98, label %72

72:                                               ; preds = %68
  br i1 %34, label %73, label %76

73:                                               ; preds = %72
  %74 = mul nsw i32 %71, %1
  %75 = add i32 %57, %74
  br label %76

76:                                               ; preds = %73, %72
  %77 = phi i32 [ %75, %73 ], [ %70, %72 ]
  br i1 %35, label %78, label %81

78:                                               ; preds = %76
  %79 = mul nsw i32 %71, %2
  %80 = add i32 %60, %79
  br label %81

81:                                               ; preds = %78, %76
  %82 = phi i32 [ %80, %78 ], [ %77, %76 ]
  br i1 %36, label %83, label %86

83:                                               ; preds = %81
  %84 = mul nsw i32 %71, %3
  %85 = add i32 %63, %84
  br label %86

86:                                               ; preds = %83, %81
  %87 = phi i32 [ %85, %83 ], [ %82, %81 ]
  br i1 %37, label %88, label %91

88:                                               ; preds = %86
  %89 = mul nsw i32 %71, %4
  %90 = add nsw i32 %65, %89
  br label %91

91:                                               ; preds = %88, %86
  %92 = phi i32 [ %90, %88 ], [ %87, %86 ]
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %97 = fadd contract float %95, %96
  store float %97, float addrspace(1)* %67, align 4, !tbaa !16
  br label %98

98:                                               ; preds = %91, %68, %43
  %99 = phi i32 [ %44, %43 ], [ %69, %68 ], [ %92, %91 ]
  %100 = add nsw i32 %45, %30
  %101 = icmp slt i32 %100, %10
  br i1 %101, label %43, label %42, !llvm.loop !20

102:                                              ; preds = %52, %150
  %103 = phi i32 [ %151, %150 ], [ %44, %52 ]
  %104 = phi i32 [ %157, %150 ], [ 0, %52 ]
  %105 = phi i32 [ %158, %150 ], [ 0, %52 ]
  br i1 %34, label %106, label %109

106:                                              ; preds = %102
  %107 = mul nsw i32 %104, %1
  %108 = add i32 %57, %107
  br label %109

109:                                              ; preds = %106, %102
  %110 = phi i32 [ %108, %106 ], [ %103, %102 ]
  br i1 %35, label %111, label %114

111:                                              ; preds = %109
  %112 = mul nsw i32 %104, %2
  %113 = add i32 %60, %112
  br label %114

114:                                              ; preds = %111, %109
  %115 = phi i32 [ %113, %111 ], [ %110, %109 ]
  br i1 %36, label %116, label %119

116:                                              ; preds = %114
  %117 = mul nsw i32 %104, %3
  %118 = add i32 %63, %117
  br label %119

119:                                              ; preds = %116, %114
  %120 = phi i32 [ %118, %116 ], [ %115, %114 ]
  br i1 %37, label %121, label %124

121:                                              ; preds = %119
  %122 = mul nsw i32 %104, %4
  %123 = add nsw i32 %65, %122
  br label %124

124:                                              ; preds = %121, %119
  %125 = phi i32 [ %123, %121 ], [ %120, %119 ]
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16
  %129 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %130 = fadd contract float %128, %129
  store float %130, float addrspace(1)* %67, align 4, !tbaa !16
  %131 = or i32 %104, 1
  br i1 %34, label %132, label %135

132:                                              ; preds = %124
  %133 = mul nsw i32 %131, %1
  %134 = add i32 %57, %133
  br label %135

135:                                              ; preds = %132, %124
  %136 = phi i32 [ %134, %132 ], [ %125, %124 ]
  br i1 %35, label %137, label %140

137:                                              ; preds = %135
  %138 = mul nsw i32 %131, %2
  %139 = add i32 %60, %138
  br label %140

140:                                              ; preds = %137, %135
  %141 = phi i32 [ %139, %137 ], [ %136, %135 ]
  br i1 %36, label %142, label %145

142:                                              ; preds = %140
  %143 = mul nsw i32 %131, %3
  %144 = add i32 %63, %143
  br label %145

145:                                              ; preds = %142, %140
  %146 = phi i32 [ %144, %142 ], [ %141, %140 ]
  br i1 %37, label %147, label %150

147:                                              ; preds = %145
  %148 = mul nsw i32 %131, %4
  %149 = add nsw i32 %65, %148
  br label %150

150:                                              ; preds = %147, %145
  %151 = phi i32 [ %149, %147 ], [ %146, %145 ]
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !16
  %155 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %156 = fadd contract float %154, %155
  store float %156, float addrspace(1)* %67, align 4, !tbaa !16
  %157 = add nuw nsw i32 %104, 2
  %158 = add i32 %105, 2
  %159 = icmp eq i32 %158, %40
  br i1 %159, label %68, label %102, !llvm.loop !22
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
