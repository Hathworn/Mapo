; ModuleID = '../data/hip_kernels/1499/2/main.cu'
source_filename = "../data/hip_kernels/1499/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20CudaPermutePVToCudnnPfS_iiiiiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = shl nsw i32 %8, 1
  %12 = sub nsw i32 %4, %11
  %13 = sdiv i32 %12, %6
  %14 = shl nsw i32 %9, 1
  %15 = sub nsw i32 %3, %14
  %16 = sdiv i32 %15, %7
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %17, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = mul i32 %5, %4
  %27 = mul i32 %26, %2
  %28 = mul i32 %27, %3
  %29 = icmp slt i32 %25, %28
  br i1 %29, label %30, label %78

30:                                               ; preds = %10
  %31 = mul i32 %26, %3
  %32 = freeze i32 %25
  %33 = freeze i32 %31
  %34 = sdiv i32 %32, %33
  %35 = mul i32 %34, %33
  %36 = sub i32 %32, %35
  %37 = sdiv i32 %36, %26
  %38 = srem i32 %25, %26
  %39 = sdiv i32 %38, %5
  %40 = srem i32 %25, %5
  %41 = icmp sge i32 %39, %8
  %42 = sub nsw i32 %4, %8
  %43 = icmp slt i32 %39, %42
  %44 = select i1 %41, i1 %43, i1 false
  br i1 %44, label %45, label %78

45:                                               ; preds = %30
  %46 = sub nsw i32 %39, %8
  %47 = icmp sge i32 %37, %9
  %48 = sub nsw i32 %3, %9
  %49 = icmp slt i32 %37, %48
  %50 = select i1 %47, i1 %49, i1 false
  br i1 %50, label %51, label %78

51:                                               ; preds = %45
  %52 = sub nsw i32 %37, %9
  %53 = freeze i32 %46
  %54 = freeze i32 %6
  %55 = sdiv i32 %53, %54
  %56 = mul i32 %55, %54
  %57 = sub i32 %53, %56
  %58 = freeze i32 %52
  %59 = freeze i32 %7
  %60 = sdiv i32 %58, %59
  %61 = mul i32 %60, %59
  %62 = sub i32 %58, %61
  %63 = mul i32 %34, %7
  %64 = add i32 %62, %63
  %65 = mul i32 %64, %6
  %66 = add i32 %65, %57
  %67 = mul i32 %66, %5
  %68 = add i32 %67, %40
  %69 = mul i32 %68, %16
  %70 = add i32 %69, %60
  %71 = mul i32 %70, %13
  %72 = add i32 %71, %55
  %73 = sext i32 %25 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = sext i32 %72 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  store float %75, float addrspace(1)* %77, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %10, %51, %30, %45
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
