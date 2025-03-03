; ModuleID = '../data/hip_kernels/1232/5/main.cu'
source_filename = "../data/hip_kernels/1232/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z7flip_3DPfmmmiii(float addrspace(1)* nocapture %0, i64 %1, i64 %2, i64 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = zext i32 %16 to i64
  %18 = mul i64 %3, %2
  %19 = mul i64 %18, %1
  %20 = freeze i64 %17
  %21 = freeze i64 %3
  %22 = udiv i64 %20, %21
  %23 = mul i64 %22, %21
  %24 = sub i64 %20, %23
  %25 = urem i64 %22, %3
  %26 = udiv i64 %17, %18
  %27 = icmp ugt i64 %19, %17
  br i1 %27, label %28, label %84

28:                                               ; preds = %7
  %29 = icmp ne i32 %6, 0
  %30 = lshr i64 %3, 1
  %31 = icmp ult i64 %24, %30
  %32 = select i1 %29, i1 %31, i1 false
  br i1 %32, label %33, label %47

33:                                               ; preds = %28
  %34 = shl i64 %19, 1
  %35 = mul i64 %26, %18
  %36 = mul i64 %25, %3
  %37 = add i64 %36, %34
  %38 = add i64 %37, %35
  %39 = add i64 %38, %24
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = xor i64 %24, -1
  %42 = add i64 %41, %3
  %43 = add i64 %42, %38
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %46, float addrspace(1)* %40, align 4, !tbaa !7
  store float %45, float addrspace(1)* %44, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %47

47:                                               ; preds = %33, %28
  %48 = icmp ne i32 %5, 0
  %49 = lshr i64 %2, 1
  %50 = icmp ult i64 %25, %49
  %51 = select i1 %48, i1 %50, i1 false
  br i1 %51, label %52, label %66

52:                                               ; preds = %47
  %53 = mul i64 %26, %18
  %54 = add i64 %53, %19
  %55 = mul i64 %25, %3
  %56 = add i64 %54, %24
  %57 = add i64 %56, %55
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = xor i64 %25, -1
  %60 = add i64 %59, %2
  %61 = mul i64 %60, %3
  %62 = add i64 %56, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %65 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  store float %65, float addrspace(1)* %58, align 4, !tbaa !7
  store float %64, float addrspace(1)* %63, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %66

66:                                               ; preds = %52, %47
  %67 = icmp ne i32 %4, 0
  %68 = lshr i64 %1, 1
  %69 = icmp ult i64 %26, %68
  %70 = select i1 %67, i1 %69, i1 false
  br i1 %70, label %71, label %84

71:                                               ; preds = %66
  %72 = mul i64 %26, %18
  %73 = mul i64 %25, %3
  %74 = add i64 %73, %24
  %75 = add i64 %74, %72
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = xor i64 %26, -1
  %78 = add i64 %77, %1
  %79 = mul i64 %78, %18
  %80 = add i64 %74, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %83 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  store float %83, float addrspace(1)* %76, align 4, !tbaa !7
  store float %82, float addrspace(1)* %81, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %84

84:                                               ; preds = %66, %71, %7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
