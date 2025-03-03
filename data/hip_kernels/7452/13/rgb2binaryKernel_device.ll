; ModuleID = '../data/hip_kernels/7452/13/main.cu'
source_filename = "../data/hip_kernels/7452/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16rgb2binaryKernelPhS_S_S_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = icmp slt i32 %15, %4
  br i1 %16, label %17, label %38

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %18
  %20 = load i8, i8 addrspace(1)* %19, align 1, !tbaa !7, !amdgpu.noclobber !6
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %18
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %18
  %24 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7, !amdgpu.noclobber !6
  %25 = uitofp i8 %20 to double
  %26 = fmul contract double %25, 2.990000e-01
  %27 = uitofp i8 %22 to double
  %28 = fmul contract double %27, 5.870000e-01
  %29 = fadd contract double %26, %28
  %30 = uitofp i8 %24 to double
  %31 = fmul contract double %30, 1.140000e-01
  %32 = fadd contract double %29, %31
  %33 = fptoui double %32 to i8
  %34 = zext i8 %33 to i32
  %35 = icmp sgt i32 %34, %5
  %36 = sext i1 %35 to i8
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %18
  store i8 %36, i8 addrspace(1)* %37, align 1, !tbaa !7
  br label %38

38:                                               ; preds = %17, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
