; ModuleID = '../data/hip_kernels/9438/7/main.cu'
source_filename = "../data/hip_kernels/9438/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8numMayorPfS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = icmp ult i32 %3, %8
  br i1 %9, label %17, label %10

10:                                               ; preds = %17, %2
  %11 = phi float [ 0.000000e+00, %2 ], [ %26, %17 ]
  %12 = phi float [ 0.000000e+00, %2 ], [ %27, %17 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = zext i32 %3 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = fcmp contract ogt float %12, %15
  br i1 %16, label %30, label %31

17:                                               ; preds = %2, %17
  %18 = phi i32 [ %28, %17 ], [ %3, %2 ]
  %19 = phi float [ %27, %17 ], [ 0.000000e+00, %2 ]
  %20 = phi float [ %26, %17 ], [ 0.000000e+00, %2 ]
  %21 = zext i32 %18 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = fcmp contract ogt float %23, %20
  %25 = sitofp i32 %18 to float
  %26 = select i1 %24, float %23, float %20
  %27 = select i1 %24, float %25, float %19
  %28 = add nuw nsw i32 %18, 1
  %29 = icmp ult i32 %28, %8
  br i1 %29, label %17, label %10, !llvm.loop !11

30:                                               ; preds = %10
  store float %12, float addrspace(1)* %14, align 4, !tbaa !7
  br label %31

31:                                               ; preds = %30, %10
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  store float %11, float addrspace(1)* %32, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
