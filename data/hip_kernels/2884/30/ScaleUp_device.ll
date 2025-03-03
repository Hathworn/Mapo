; ModuleID = '../data/hip_kernels/2884/30/main.cu'
source_filename = "../data/hip_kernels/2884/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7ScaleUpPfS_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 6
  %11 = shl nuw nsw i32 %7, 1
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %13, 3
  %15 = shl nuw nsw i32 %8, 1
  %16 = add i32 %14, %15
  %17 = shl nsw i32 %2, 1
  %18 = icmp slt i32 %12, %17
  %19 = shl nsw i32 %4, 1
  %20 = icmp slt i32 %16, %19
  %21 = select i1 %18, i1 %20, i1 false
  br i1 %21, label %22, label %73

22:                                               ; preds = %6
  %23 = shl i32 %9, 5
  %24 = add i32 %23, %7
  %25 = shl i32 %13, 2
  %26 = add i32 %25, %8
  %27 = add nsw i32 %24, 1
  %28 = add nsw i32 %2, -1
  %29 = tail call i32 @llvm.smin.i32(i32 %27, i32 %28)
  %30 = add nsw i32 %26, 1
  %31 = add nsw i32 %4, -1
  %32 = tail call i32 @llvm.smin.i32(i32 %30, i32 %31)
  %33 = mul nsw i32 %26, %3
  %34 = add nsw i32 %33, %24
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = add nsw i32 %33, %29
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = mul nsw i32 %32, %3
  %43 = add nsw i32 %42, %24
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = add nsw i32 %42, %29
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = mul nsw i32 %16, %5
  %52 = add nsw i32 %51, %12
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %37, float addrspace(1)* %54, align 4, !tbaa !5
  %55 = fadd contract float %37, %41
  %56 = fmul contract float %55, 5.000000e-01
  %57 = or i32 %52, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  store float %56, float addrspace(1)* %59, align 4, !tbaa !5
  %60 = fadd contract float %37, %46
  %61 = fmul contract float %60, 5.000000e-01
  %62 = or i32 %16, 1
  %63 = mul nsw i32 %62, %5
  %64 = add nsw i32 %63, %12
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  store float %61, float addrspace(1)* %66, align 4, !tbaa !5
  %67 = fadd contract float %55, %46
  %68 = fadd contract float %67, %50
  %69 = fmul contract float %68, 2.500000e-01
  %70 = add nsw i32 %64, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float %69, float addrspace(1)* %72, align 4, !tbaa !5
  br label %73

73:                                               ; preds = %22, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
