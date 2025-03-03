; ModuleID = '../data/hip_kernels/2583/7/main.cu'
source_filename = "../data/hip_kernels/2583/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20noactivationGradientiiPfS_if(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture writeonly %3, i32 %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %0
  %25 = add nsw i32 %24, %15
  %26 = fsub contract float 1.000000e+00, %5
  %27 = fdiv contract float 1.000000e+00, %26
  %28 = icmp slt i32 %15, %0
  %29 = icmp slt i32 %23, %1
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %68

31:                                               ; preds = %6
  %32 = shl i32 %4, 20
  %33 = add nsw i32 %25, %32
  %34 = xor i32 %33, 746559103
  %35 = mul i32 %34, 1228688033
  %36 = add i32 %35, 123456789
  %37 = add i32 %35, 5783321
  %38 = lshr i32 %36, 2
  %39 = xor i32 %38, %36
  %40 = fcmp contract une float %5, 0.000000e+00
  br i1 %40, label %41, label %65

41:                                               ; preds = %31
  %42 = icmp sgt i32 %33, -1
  %43 = select i1 %42, i32 -1973591729, i32 -100066652
  %44 = shl i32 %39, 1
  %45 = shl i32 %37, 4
  %46 = xor i32 %45, %44
  %47 = xor i32 %46, %37
  %48 = xor i32 %47, %39
  %49 = add i32 %35, 6977678
  %50 = add i32 %49, %43
  %51 = add i32 %50, %48
  %52 = uitofp i32 %51 to float
  %53 = fmul contract float %52, 0x3DF0000000000000
  %54 = fadd contract float %53, 0x3DF0000000000000
  %55 = fcmp contract olt float %54, %5
  %56 = sext i32 %25 to i64
  br i1 %55, label %57, label %60

57:                                               ; preds = %41
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  store float 0.000000e+00, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  store float 0.000000e+00, float addrspace(1)* %59, align 4, !tbaa !7
  br label %68

60:                                               ; preds = %41
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  store float %27, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = fmul contract float %27, %63
  store float %64, float addrspace(1)* %62, align 4, !tbaa !7
  br label %68

65:                                               ; preds = %31
  %66 = sext i32 %25 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %66
  store float 1.000000e+00, float addrspace(1)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %65, %60, %57, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
