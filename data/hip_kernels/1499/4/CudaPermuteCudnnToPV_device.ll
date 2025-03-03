; ModuleID = '../data/hip_kernels/1499/4/main.cu'
source_filename = "../data/hip_kernels/1499/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20CudaPermuteCudnnToPVPfS_iiiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = mul i32 %5, %4
  %19 = mul i32 %18, %2
  %20 = mul i32 %19, %3
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %60

22:                                               ; preds = %8
  %23 = sdiv i32 %3, %7
  %24 = sdiv i32 %4, %6
  %25 = mul i32 %18, %3
  %26 = freeze i32 %17
  %27 = freeze i32 %25
  %28 = sdiv i32 %26, %27
  %29 = mul i32 %28, %27
  %30 = sub i32 %26, %29
  %31 = sdiv i32 %30, %18
  %32 = srem i32 %17, %18
  %33 = sdiv i32 %32, %5
  %34 = srem i32 %17, %5
  %35 = freeze i32 %33
  %36 = freeze i32 %6
  %37 = sdiv i32 %35, %36
  %38 = mul i32 %37, %36
  %39 = sub i32 %35, %38
  %40 = freeze i32 %31
  %41 = freeze i32 %7
  %42 = sdiv i32 %40, %41
  %43 = mul i32 %42, %41
  %44 = sub i32 %40, %43
  %45 = mul i32 %28, %7
  %46 = add i32 %44, %45
  %47 = mul i32 %46, %6
  %48 = add i32 %47, %39
  %49 = mul i32 %48, %5
  %50 = add i32 %49, %34
  %51 = mul i32 %50, %23
  %52 = add i32 %51, %42
  %53 = mul i32 %52, %24
  %54 = add i32 %53, %37
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = sext i32 %17 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  store float %57, float addrspace(1)* %59, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %22, %8
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
