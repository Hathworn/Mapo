; ModuleID = '../data/hip_kernels/7613/9/main.cu'
source_filename = "../data/hip_kernels/7613/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15attentionKernelPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %184

14:                                               ; preds = %3
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %16, label %39

16:                                               ; preds = %14
  %17 = and i32 %1, 7
  %18 = icmp ult i32 %1, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %16
  %20 = and i32 %1, -8
  br label %46

21:                                               ; preds = %46, %16
  %22 = phi float [ undef, %16 ], [ %104, %46 ]
  %23 = phi i32 [ 0, %16 ], [ %105, %46 ]
  %24 = phi float [ 0.000000e+00, %16 ], [ %104, %46 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %39, label %26

26:                                               ; preds = %21, %26
  %27 = phi i32 [ %36, %26 ], [ %23, %21 ]
  %28 = phi float [ %35, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %37, %26 ], [ 0, %21 ]
  %30 = mul nsw i32 %27, %2
  %31 = add nsw i32 %30, %12
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = fadd contract float %28, %34
  %36 = add nuw nsw i32 %27, 1
  %37 = add i32 %29, 1
  %38 = icmp eq i32 %37, %17
  br i1 %38, label %39, label %26, !llvm.loop !11

39:                                               ; preds = %21, %26, %14
  %40 = phi float [ 0.000000e+00, %14 ], [ %22, %21 ], [ %35, %26 ]
  br i1 %15, label %41, label %184

41:                                               ; preds = %39
  %42 = and i32 %1, 7
  %43 = icmp ult i32 %1, 8
  br i1 %43, label %169, label %44

44:                                               ; preds = %41
  %45 = and i32 %1, -8
  br label %108

46:                                               ; preds = %46, %19
  %47 = phi i32 [ 0, %19 ], [ %105, %46 ]
  %48 = phi float [ 0.000000e+00, %19 ], [ %104, %46 ]
  %49 = phi i32 [ 0, %19 ], [ %106, %46 ]
  %50 = mul nsw i32 %47, %2
  %51 = add nsw i32 %50, %12
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fadd contract float %48, %54
  %56 = or i32 %47, 1
  %57 = mul nsw i32 %56, %2
  %58 = add nsw i32 %57, %12
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = fadd contract float %55, %61
  %63 = or i32 %47, 2
  %64 = mul nsw i32 %63, %2
  %65 = add nsw i32 %64, %12
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = fadd contract float %62, %68
  %70 = or i32 %47, 3
  %71 = mul nsw i32 %70, %2
  %72 = add nsw i32 %71, %12
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fadd contract float %69, %75
  %77 = or i32 %47, 4
  %78 = mul nsw i32 %77, %2
  %79 = add nsw i32 %78, %12
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fadd contract float %76, %82
  %84 = or i32 %47, 5
  %85 = mul nsw i32 %84, %2
  %86 = add nsw i32 %85, %12
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fadd contract float %83, %89
  %91 = or i32 %47, 6
  %92 = mul nsw i32 %91, %2
  %93 = add nsw i32 %92, %12
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fadd contract float %90, %96
  %98 = or i32 %47, 7
  %99 = mul nsw i32 %98, %2
  %100 = add nsw i32 %99, %12
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fadd contract float %97, %103
  %105 = add nuw nsw i32 %47, 8
  %106 = add i32 %49, 8
  %107 = icmp eq i32 %106, %20
  br i1 %107, label %21, label %46, !llvm.loop !13

108:                                              ; preds = %108, %44
  %109 = phi i32 [ 0, %44 ], [ %166, %108 ]
  %110 = phi i32 [ 0, %44 ], [ %167, %108 ]
  %111 = mul nsw i32 %109, %2
  %112 = add nsw i32 %111, %12
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = fmul contract float %40, %115
  store float %116, float addrspace(1)* %114, align 4, !tbaa !7
  %117 = or i32 %109, 1
  %118 = mul nsw i32 %117, %2
  %119 = add nsw i32 %118, %12
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %40, %122
  store float %123, float addrspace(1)* %121, align 4, !tbaa !7
  %124 = or i32 %109, 2
  %125 = mul nsw i32 %124, %2
  %126 = add nsw i32 %125, %12
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = fmul contract float %40, %129
  store float %130, float addrspace(1)* %128, align 4, !tbaa !7
  %131 = or i32 %109, 3
  %132 = mul nsw i32 %131, %2
  %133 = add nsw i32 %132, %12
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fmul contract float %40, %136
  store float %137, float addrspace(1)* %135, align 4, !tbaa !7
  %138 = or i32 %109, 4
  %139 = mul nsw i32 %138, %2
  %140 = add nsw i32 %139, %12
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = fmul contract float %40, %143
  store float %144, float addrspace(1)* %142, align 4, !tbaa !7
  %145 = or i32 %109, 5
  %146 = mul nsw i32 %145, %2
  %147 = add nsw i32 %146, %12
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = fmul contract float %40, %150
  store float %151, float addrspace(1)* %149, align 4, !tbaa !7
  %152 = or i32 %109, 6
  %153 = mul nsw i32 %152, %2
  %154 = add nsw i32 %153, %12
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7
  %158 = fmul contract float %40, %157
  store float %158, float addrspace(1)* %156, align 4, !tbaa !7
  %159 = or i32 %109, 7
  %160 = mul nsw i32 %159, %2
  %161 = add nsw i32 %160, %12
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = fmul contract float %40, %164
  store float %165, float addrspace(1)* %163, align 4, !tbaa !7
  %166 = add nuw nsw i32 %109, 8
  %167 = add i32 %110, 8
  %168 = icmp eq i32 %167, %45
  br i1 %168, label %169, label %108, !llvm.loop !15

169:                                              ; preds = %108, %41
  %170 = phi i32 [ 0, %41 ], [ %166, %108 ]
  %171 = icmp eq i32 %42, 0
  br i1 %171, label %184, label %172

172:                                              ; preds = %169, %172
  %173 = phi i32 [ %181, %172 ], [ %170, %169 ]
  %174 = phi i32 [ %182, %172 ], [ 0, %169 ]
  %175 = mul nsw i32 %173, %2
  %176 = add nsw i32 %175, %12
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = fmul contract float %40, %179
  store float %180, float addrspace(1)* %178, align 4, !tbaa !7
  %181 = add nuw nsw i32 %173, 1
  %182 = add i32 %174, 1
  %183 = icmp eq i32 %182, %42
  br i1 %183, label %184, label %172, !llvm.loop !16

184:                                              ; preds = %169, %172, %39, %3
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
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
