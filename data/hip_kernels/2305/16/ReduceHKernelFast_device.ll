; ModuleID = '../data/hip_kernels/2305/16/main.cu'
source_filename = "../data/hip_kernels/2305/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z17ReduceHKernelFastPKhPfii(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = shl i32 %14, 7
  %16 = icmp slt i32 %13, %2
  br i1 %16, label %17, label %38

17:                                               ; preds = %4
  %18 = add nsw i32 %15, 128
  %19 = tail call i32 @llvm.smin.i32(i32 %18, i32 %3)
  %20 = icmp slt i32 %15, %19
  br i1 %20, label %26, label %21

21:                                               ; preds = %26, %17
  %22 = phi float [ 0.000000e+00, %17 ], [ %35, %26 ]
  %23 = sext i32 %13 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = atomicrmw fadd float addrspace(1)* %24, float %22 syncscope("agent-one-as") monotonic, align 4
  br label %38

26:                                               ; preds = %17, %26
  %27 = phi i32 [ %36, %26 ], [ %15, %17 ]
  %28 = phi float [ %35, %26 ], [ 0.000000e+00, %17 ]
  %29 = mul nsw i32 %27, %2
  %30 = add nsw i32 %29, %13
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !7, !amdgpu.noclobber !5
  %34 = uitofp i8 %33 to float
  %35 = fadd contract float %28, %34
  %36 = add nsw i32 %27, 1
  %37 = icmp slt i32 %36, %19
  br i1 %37, label %26, label %21, !llvm.loop !10

38:                                               ; preds = %21, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
