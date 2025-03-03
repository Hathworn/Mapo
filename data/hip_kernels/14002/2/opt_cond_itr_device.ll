; ModuleID = '../data/hip_kernels/14002/2/main.cu'
source_filename = "../data/hip_kernels/14002/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12opt_cond_itriPdddiiddiiS_(i32 %0, double addrspace(1)* nocapture %1, double %2, double %3, i32 %4, i32 %5, double %6, double %7, i32 %8, i32 %9, double addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %0
  br i1 %21, label %22, label %46

22:                                               ; preds = %11
  %23 = fsub contract double %2, %3
  %24 = sitofp i32 %4 to double
  %25 = fmul contract double %23, %24
  %26 = mul nsw i32 %5, %0
  %27 = add nsw i32 %20, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %10, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !5
  %31 = fmul contract double %25, %30
  %32 = fsub contract double %6, %7
  %33 = sitofp i32 %8 to double
  %34 = fmul contract double %32, %33
  %35 = mul nsw i32 %9, %0
  %36 = add nsw i32 %20, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %10, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract double %34, %39
  %41 = fadd contract double %31, %40
  %42 = sext i32 %20 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %1, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !5
  %45 = fadd contract double %44, %41
  store double %45, double addrspace(1)* %43, align 8, !tbaa !7
  br label %46

46:                                               ; preds = %22, %11
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
