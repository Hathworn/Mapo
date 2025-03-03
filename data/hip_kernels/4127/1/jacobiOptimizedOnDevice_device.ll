; ModuleID = '../data/hip_kernels/4127/1/main.cu'
source_filename = "../data/hip_kernels/4127/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23jacobiOptimizedOnDevicePfS_S_S_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %4
  br i1 %16, label %17, label %180

17:                                               ; preds = %6
  %18 = mul nsw i32 %15, %5
  %19 = icmp sgt i32 %5, 0
  br i1 %19, label %20, label %50

20:                                               ; preds = %17
  %21 = and i32 %5, 7
  %22 = icmp ult i32 %5, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %20
  %24 = and i32 %5, -8
  br label %62

25:                                               ; preds = %175, %20
  %26 = phi float [ undef, %20 ], [ %176, %175 ]
  %27 = phi i32 [ 0, %20 ], [ %177, %175 ]
  %28 = phi float [ 0.000000e+00, %20 ], [ %176, %175 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %50, label %30

30:                                               ; preds = %25, %45
  %31 = phi i32 [ %47, %45 ], [ %27, %25 ]
  %32 = phi float [ %46, %45 ], [ %28, %25 ]
  %33 = phi i32 [ %48, %45 ], [ 0, %25 ]
  %34 = icmp eq i32 %15, %31
  br i1 %34, label %45, label %35

35:                                               ; preds = %30
  %36 = add nsw i32 %31, %18
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = zext i32 %31 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = fmul contract float %39, %42
  %44 = fadd contract float %32, %43
  br label %45

45:                                               ; preds = %35, %30
  %46 = phi float [ %44, %35 ], [ %32, %30 ]
  %47 = add nuw nsw i32 %31, 1
  %48 = add i32 %33, 1
  %49 = icmp eq i32 %48, %21
  br i1 %49, label %50, label %30, !llvm.loop !11

50:                                               ; preds = %25, %45, %17
  %51 = phi float [ 0.000000e+00, %17 ], [ %26, %25 ], [ %46, %45 ]
  %52 = sext i32 %15 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fsub contract float %54, %51
  %56 = add nsw i32 %18, %15
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fdiv contract float %55, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  store float %60, float addrspace(1)* %61, align 4, !tbaa !7
  br label %180

62:                                               ; preds = %175, %23
  %63 = phi i32 [ 0, %23 ], [ %177, %175 ]
  %64 = phi float [ 0.000000e+00, %23 ], [ %176, %175 ]
  %65 = phi i32 [ 0, %23 ], [ %178, %175 ]
  %66 = icmp eq i32 %15, %63
  br i1 %66, label %77, label %67

67:                                               ; preds = %62
  %68 = add nsw i32 %63, %18
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = zext i32 %63 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %71, %74
  %76 = fadd contract float %64, %75
  br label %77

77:                                               ; preds = %62, %67
  %78 = phi float [ %76, %67 ], [ %64, %62 ]
  %79 = or i32 %63, 1
  %80 = icmp eq i32 %15, %79
  br i1 %80, label %91, label %81

81:                                               ; preds = %77
  %82 = add nsw i32 %79, %18
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = zext i32 %79 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract float %85, %88
  %90 = fadd contract float %78, %89
  br label %91

91:                                               ; preds = %81, %77
  %92 = phi float [ %90, %81 ], [ %78, %77 ]
  %93 = or i32 %63, 2
  %94 = icmp eq i32 %15, %93
  br i1 %94, label %105, label %95

95:                                               ; preds = %91
  %96 = add nsw i32 %93, %18
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = zext i32 %93 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fmul contract float %99, %102
  %104 = fadd contract float %92, %103
  br label %105

105:                                              ; preds = %95, %91
  %106 = phi float [ %104, %95 ], [ %92, %91 ]
  %107 = or i32 %63, 3
  %108 = icmp eq i32 %15, %107
  br i1 %108, label %119, label %109

109:                                              ; preds = %105
  %110 = add nsw i32 %107, %18
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = zext i32 %107 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract float %113, %116
  %118 = fadd contract float %106, %117
  br label %119

119:                                              ; preds = %109, %105
  %120 = phi float [ %118, %109 ], [ %106, %105 ]
  %121 = or i32 %63, 4
  %122 = icmp eq i32 %15, %121
  br i1 %122, label %133, label %123

123:                                              ; preds = %119
  %124 = add nsw i32 %121, %18
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = zext i32 %121 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fmul contract float %127, %130
  %132 = fadd contract float %120, %131
  br label %133

133:                                              ; preds = %123, %119
  %134 = phi float [ %132, %123 ], [ %120, %119 ]
  %135 = or i32 %63, 5
  %136 = icmp eq i32 %15, %135
  br i1 %136, label %147, label %137

137:                                              ; preds = %133
  %138 = add nsw i32 %135, %18
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !5
  %142 = zext i32 %135 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = fmul contract float %141, %144
  %146 = fadd contract float %134, %145
  br label %147

147:                                              ; preds = %137, %133
  %148 = phi float [ %146, %137 ], [ %134, %133 ]
  %149 = or i32 %63, 6
  %150 = icmp eq i32 %15, %149
  br i1 %150, label %161, label %151

151:                                              ; preds = %147
  %152 = add nsw i32 %149, %18
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = zext i32 %149 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = fmul contract float %155, %158
  %160 = fadd contract float %148, %159
  br label %161

161:                                              ; preds = %151, %147
  %162 = phi float [ %160, %151 ], [ %148, %147 ]
  %163 = or i32 %63, 7
  %164 = icmp eq i32 %15, %163
  br i1 %164, label %175, label %165

165:                                              ; preds = %161
  %166 = add nsw i32 %163, %18
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !5
  %170 = zext i32 %163 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %2, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !5
  %173 = fmul contract float %169, %172
  %174 = fadd contract float %162, %173
  br label %175

175:                                              ; preds = %165, %161
  %176 = phi float [ %174, %165 ], [ %162, %161 ]
  %177 = add nuw nsw i32 %63, 8
  %178 = add i32 %65, 8
  %179 = icmp eq i32 %178, %24
  br i1 %179, label %25, label %62, !llvm.loop !13

180:                                              ; preds = %50, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
