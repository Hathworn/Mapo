; ModuleID = '../data/hip_kernels/9543/0/main.cu'
source_filename = "../data/hip_kernels/9543/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16computeDistancesiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sdiv i32 %13, %0
  %15 = mul nsw i32 %14, %0
  %16 = sub nsw i32 %13, %15
  %17 = mul nsw i32 %0, %0
  %18 = icmp slt i32 %13, %17
  br i1 %18, label %19, label %184

19:                                               ; preds = %4
  %20 = mul nsw i32 %14, %1
  %21 = mul nsw i32 %16, %1
  %22 = icmp sgt i32 %1, 1
  br i1 %22, label %23, label %53

23:                                               ; preds = %19
  %24 = add i32 %1, -1
  %25 = add i32 %1, -2
  %26 = and i32 %24, 7
  %27 = icmp ult i32 %25, 7
  br i1 %27, label %30, label %28

28:                                               ; preds = %23
  %29 = and i32 %24, -8
  br label %82

30:                                               ; preds = %82, %23
  %31 = phi float [ undef, %23 ], [ %180, %82 ]
  %32 = phi i32 [ 1, %23 ], [ %181, %82 ]
  %33 = phi float [ 0.000000e+00, %23 ], [ %180, %82 ]
  %34 = icmp eq i32 %26, 0
  br i1 %34, label %53, label %35

35:                                               ; preds = %30, %35
  %36 = phi i32 [ %50, %35 ], [ %32, %30 ]
  %37 = phi float [ %49, %35 ], [ %33, %30 ]
  %38 = phi i32 [ %51, %35 ], [ 0, %30 ]
  %39 = add nsw i32 %36, %20
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = add nsw i32 %36, %21
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fsub contract float %42, %46
  %48 = fmul contract float %47, %47
  %49 = fadd contract float %37, %48
  %50 = add nuw nsw i32 %36, 1
  %51 = add i32 %38, 1
  %52 = icmp eq i32 %51, %26
  br i1 %52, label %53, label %35, !llvm.loop !11

53:                                               ; preds = %30, %35, %19
  %54 = phi float [ 0.000000e+00, %19 ], [ %31, %30 ], [ %49, %35 ]
  %55 = fcmp olt float %54, 0x39F0000000000000
  %56 = select i1 %55, float 0x41F0000000000000, float 1.000000e+00
  %57 = fmul float %54, %56
  %58 = tail call float @llvm.sqrt.f32(float %57)
  %59 = bitcast float %58 to i32
  %60 = add nsw i32 %59, -1
  %61 = bitcast i32 %60 to float
  %62 = add nsw i32 %59, 1
  %63 = bitcast i32 %62 to float
  %64 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 608)
  %65 = select i1 %55, float 0x3EF0000000000000, float 1.000000e+00
  %66 = fneg float %63
  %67 = tail call float @llvm.fma.f32(float %66, float %58, float %57)
  %68 = fcmp ogt float %67, 0.000000e+00
  %69 = fneg float %61
  %70 = tail call float @llvm.fma.f32(float %69, float %58, float %57)
  %71 = fcmp ole float %70, 0.000000e+00
  %72 = select i1 %71, float %61, float %58
  %73 = select i1 %68, float %63, float %72
  %74 = fmul float %65, %73
  %75 = select i1 %64, float %57, float %74
  %76 = sext i32 %13 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  store float %75, float addrspace(1)* %77, align 4, !tbaa !7
  %78 = mul nsw i32 %16, %0
  %79 = add nsw i32 %78, %14
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  store float %75, float addrspace(1)* %81, align 4, !tbaa !7
  br label %184

82:                                               ; preds = %82, %28
  %83 = phi i32 [ 1, %28 ], [ %181, %82 ]
  %84 = phi float [ 0.000000e+00, %28 ], [ %180, %82 ]
  %85 = phi i32 [ 0, %28 ], [ %182, %82 ]
  %86 = add nsw i32 %83, %20
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = add nsw i32 %83, %21
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fsub contract float %89, %93
  %95 = fmul contract float %94, %94
  %96 = fadd contract float %84, %95
  %97 = add nuw nsw i32 %83, 1
  %98 = add nsw i32 %97, %20
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = add nsw i32 %97, %21
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fsub contract float %101, %105
  %107 = fmul contract float %106, %106
  %108 = fadd contract float %96, %107
  %109 = add nuw nsw i32 %83, 2
  %110 = add nsw i32 %109, %20
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %2, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = add nsw i32 %109, %21
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fsub contract float %113, %117
  %119 = fmul contract float %118, %118
  %120 = fadd contract float %108, %119
  %121 = add nuw nsw i32 %83, 3
  %122 = add nsw i32 %121, %20
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = add nsw i32 %121, %21
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %2, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = fsub contract float %125, %129
  %131 = fmul contract float %130, %130
  %132 = fadd contract float %120, %131
  %133 = add nuw nsw i32 %83, 4
  %134 = add nsw i32 %133, %20
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = add nsw i32 %133, %21
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !5
  %142 = fsub contract float %137, %141
  %143 = fmul contract float %142, %142
  %144 = fadd contract float %132, %143
  %145 = add nuw nsw i32 %83, 5
  %146 = add nsw i32 %145, %20
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !5
  %150 = add nsw i32 %145, %21
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %2, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = fsub contract float %149, %153
  %155 = fmul contract float %154, %154
  %156 = fadd contract float %144, %155
  %157 = add nuw nsw i32 %83, 6
  %158 = add nsw i32 %157, %20
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !5
  %162 = add nsw i32 %157, %21
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !5
  %166 = fsub contract float %161, %165
  %167 = fmul contract float %166, %166
  %168 = fadd contract float %156, %167
  %169 = add nuw nsw i32 %83, 7
  %170 = add nsw i32 %169, %20
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %2, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7, !amdgpu.noclobber !5
  %174 = add nsw i32 %169, %21
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7, !amdgpu.noclobber !5
  %178 = fsub contract float %173, %177
  %179 = fmul contract float %178, %178
  %180 = fadd contract float %168, %179
  %181 = add nuw nsw i32 %83, 8
  %182 = add i32 %85, 8
  %183 = icmp eq i32 %182, %29
  br i1 %183, label %30, label %82, !llvm.loop !13

184:                                              ; preds = %53, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
