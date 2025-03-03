; ModuleID = '../data/hip_kernels/7764/12/main.cu'
source_filename = "../data/hip_kernels/7764/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14pre_mul_kerneliPdS_(i32 %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = shl i32 %12, 1
  %14 = icmp eq i32 %12, 0
  br i1 %14, label %52, label %15

15:                                               ; preds = %3
  %16 = ashr i32 %0, 2
  %17 = sub nsw i32 %0, %13
  %18 = sub nsw i32 %16, %12
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %2, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !5
  %22 = fsub contract double 5.000000e-01, %21
  %23 = sext i32 %12 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %2, i64 %23
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !7, !amdgpu.noclobber !5
  %26 = sext i32 %13 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %1, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !7, !amdgpu.noclobber !5
  %29 = add nuw nsw i32 %13, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !5
  %33 = sext i32 %17 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %17, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !5
  %40 = fsub contract double %28, %35
  %41 = fadd contract double %32, %39
  %42 = fmul contract double %22, %40
  %43 = fmul contract double %25, %41
  %44 = fsub contract double %42, %43
  %45 = fmul contract double %22, %41
  %46 = fmul contract double %25, %40
  %47 = fadd contract double %46, %45
  %48 = fsub contract double %28, %44
  %49 = fsub contract double %32, %47
  %50 = fadd contract double %35, %44
  %51 = fsub contract double %39, %47
  store double %48, double addrspace(1)* %27, align 8, !tbaa !7
  store double %49, double addrspace(1)* %31, align 8, !tbaa !7
  store double %50, double addrspace(1)* %34, align 8, !tbaa !7
  store double %51, double addrspace(1)* %38, align 8, !tbaa !7
  br label %52

52:                                               ; preds = %15, %3
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
