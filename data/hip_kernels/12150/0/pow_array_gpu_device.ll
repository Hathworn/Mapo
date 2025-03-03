; ModuleID = '../data/hip_kernels/12150/0/main.cu'
source_filename = "../data/hip_kernels/12150/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13pow_array_gpuPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %50

14:                                               ; preds = %3
  %15 = icmp sgt i32 %1, 0
  %16 = sext i32 %12 to i64
  br i1 %15, label %17, label %34

17:                                               ; preds = %14
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = and i32 %1, 7
  %21 = icmp ult i32 %1, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %17
  %23 = and i32 %1, -8
  br label %37

24:                                               ; preds = %37, %17
  %25 = phi float [ undef, %17 ], [ %47, %37 ]
  %26 = phi float [ 1.000000e+00, %17 ], [ %47, %37 ]
  %27 = icmp eq i32 %20, 0
  br i1 %27, label %34, label %28

28:                                               ; preds = %24, %28
  %29 = phi float [ %31, %28 ], [ %26, %24 ]
  %30 = phi i32 [ %32, %28 ], [ 0, %24 ]
  %31 = fmul contract float %29, %19
  %32 = add i32 %30, 1
  %33 = icmp eq i32 %32, %20
  br i1 %33, label %34, label %28, !llvm.loop !11

34:                                               ; preds = %24, %28, %14
  %35 = phi float [ 1.000000e+00, %14 ], [ %25, %24 ], [ %31, %28 ]
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  br label %50

37:                                               ; preds = %37, %22
  %38 = phi float [ 1.000000e+00, %22 ], [ %47, %37 ]
  %39 = phi i32 [ 0, %22 ], [ %48, %37 ]
  %40 = fmul contract float %38, %19
  %41 = fmul contract float %40, %19
  %42 = fmul contract float %41, %19
  %43 = fmul contract float %42, %19
  %44 = fmul contract float %43, %19
  %45 = fmul contract float %44, %19
  %46 = fmul contract float %45, %19
  %47 = fmul contract float %46, %19
  %48 = add i32 %39, 8
  %49 = icmp eq i32 %48, %23
  br i1 %49, label %24, label %37, !llvm.loop !13

50:                                               ; preds = %34, %3
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
