; ModuleID = '../data/hip_kernels/4127/0/main.cu'
source_filename = "../data/hip_kernels/4127/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14jacobiOnDevicePfS_S_S_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp sgt i32 %5, 0
  %9 = mul nsw i32 %7, %5
  br i1 %8, label %10, label %40

10:                                               ; preds = %6
  %11 = and i32 %5, 7
  %12 = icmp ult i32 %5, 8
  br i1 %12, label %15, label %13

13:                                               ; preds = %10
  %14 = and i32 %5, -8
  br label %52

15:                                               ; preds = %165, %10
  %16 = phi float [ undef, %10 ], [ %166, %165 ]
  %17 = phi i32 [ 0, %10 ], [ %167, %165 ]
  %18 = phi float [ 0.000000e+00, %10 ], [ %166, %165 ]
  %19 = icmp eq i32 %11, 0
  br i1 %19, label %40, label %20

20:                                               ; preds = %15, %35
  %21 = phi i32 [ %37, %35 ], [ %17, %15 ]
  %22 = phi float [ %36, %35 ], [ %18, %15 ]
  %23 = phi i32 [ %38, %35 ], [ 0, %15 ]
  %24 = icmp eq i32 %7, %21
  br i1 %24, label %35, label %25

25:                                               ; preds = %20
  %26 = add nsw i32 %21, %9
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = zext i32 %21 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fmul contract float %29, %32
  %34 = fadd contract float %22, %33
  br label %35

35:                                               ; preds = %25, %20
  %36 = phi float [ %34, %25 ], [ %22, %20 ]
  %37 = add nuw nsw i32 %21, 1
  %38 = add i32 %23, 1
  %39 = icmp eq i32 %38, %11
  br i1 %39, label %40, label %20, !llvm.loop !10

40:                                               ; preds = %15, %35, %6
  %41 = phi float [ 0.000000e+00, %6 ], [ %16, %15 ], [ %36, %35 ]
  %42 = zext i32 %7 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = fsub contract float %44, %41
  %46 = add nsw i32 %9, %7
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = fdiv contract float %45, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  store float %50, float addrspace(1)* %51, align 4, !tbaa !5
  ret void

52:                                               ; preds = %165, %13
  %53 = phi i32 [ 0, %13 ], [ %167, %165 ]
  %54 = phi float [ 0.000000e+00, %13 ], [ %166, %165 ]
  %55 = phi i32 [ 0, %13 ], [ %168, %165 ]
  %56 = icmp eq i32 %7, %53
  br i1 %56, label %67, label %57

57:                                               ; preds = %52
  %58 = add nsw i32 %53, %9
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = zext i32 %53 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = fmul contract float %61, %64
  %66 = fadd contract float %54, %65
  br label %67

67:                                               ; preds = %52, %57
  %68 = phi float [ %66, %57 ], [ %54, %52 ]
  %69 = or i32 %53, 1
  %70 = icmp eq i32 %7, %69
  br i1 %70, label %81, label %71

71:                                               ; preds = %67
  %72 = add nsw i32 %69, %9
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = zext i32 %69 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = fmul contract float %75, %78
  %80 = fadd contract float %68, %79
  br label %81

81:                                               ; preds = %71, %67
  %82 = phi float [ %80, %71 ], [ %68, %67 ]
  %83 = or i32 %53, 2
  %84 = icmp eq i32 %7, %83
  br i1 %84, label %95, label %85

85:                                               ; preds = %81
  %86 = add nsw i32 %83, %9
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = zext i32 %83 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = fmul contract float %89, %92
  %94 = fadd contract float %82, %93
  br label %95

95:                                               ; preds = %85, %81
  %96 = phi float [ %94, %85 ], [ %82, %81 ]
  %97 = or i32 %53, 3
  %98 = icmp eq i32 %7, %97
  br i1 %98, label %109, label %99

99:                                               ; preds = %95
  %100 = add nsw i32 %97, %9
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = zext i32 %97 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  %107 = fmul contract float %103, %106
  %108 = fadd contract float %96, %107
  br label %109

109:                                              ; preds = %99, %95
  %110 = phi float [ %108, %99 ], [ %96, %95 ]
  %111 = or i32 %53, 4
  %112 = icmp eq i32 %7, %111
  br i1 %112, label %123, label %113

113:                                              ; preds = %109
  %114 = add nsw i32 %111, %9
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = zext i32 %111 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = fmul contract float %117, %120
  %122 = fadd contract float %110, %121
  br label %123

123:                                              ; preds = %113, %109
  %124 = phi float [ %122, %113 ], [ %110, %109 ]
  %125 = or i32 %53, 5
  %126 = icmp eq i32 %7, %125
  br i1 %126, label %137, label %127

127:                                              ; preds = %123
  %128 = add nsw i32 %125, %9
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = zext i32 %125 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %2, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  %135 = fmul contract float %131, %134
  %136 = fadd contract float %124, %135
  br label %137

137:                                              ; preds = %127, %123
  %138 = phi float [ %136, %127 ], [ %124, %123 ]
  %139 = or i32 %53, 6
  %140 = icmp eq i32 %7, %139
  br i1 %140, label %151, label %141

141:                                              ; preds = %137
  %142 = add nsw i32 %139, %9
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !5, !amdgpu.noclobber !9
  %146 = zext i32 %139 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5, !amdgpu.noclobber !9
  %149 = fmul contract float %145, %148
  %150 = fadd contract float %138, %149
  br label %151

151:                                              ; preds = %141, %137
  %152 = phi float [ %150, %141 ], [ %138, %137 ]
  %153 = or i32 %53, 7
  %154 = icmp eq i32 %7, %153
  br i1 %154, label %165, label %155

155:                                              ; preds = %151
  %156 = add nsw i32 %153, %9
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !5, !amdgpu.noclobber !9
  %160 = zext i32 %153 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %2, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !5, !amdgpu.noclobber !9
  %163 = fmul contract float %159, %162
  %164 = fadd contract float %152, %163
  br label %165

165:                                              ; preds = %155, %151
  %166 = phi float [ %164, %155 ], [ %152, %151 ]
  %167 = add nuw nsw i32 %53, 8
  %168 = add i32 %55, 8
  %169 = icmp eq i32 %168, %14
  br i1 %169, label %15, label %52, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
