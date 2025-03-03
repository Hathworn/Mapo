; ModuleID = '../data/hip_kernels/12483/21/main.cu'
source_filename = "../data/hip_kernels/12483/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14set_chunk_dataiiddPdS_S_S_S_S_S_S_S_(i32 %0, i32 %1, double %2, double %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture writeonly %5, double addrspace(1)* nocapture writeonly %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture writeonly %10, double addrspace(1)* nocapture writeonly %11, double addrspace(1)* nocapture writeonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %24, label %36

24:                                               ; preds = %13
  %25 = sext i32 %22 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %8, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !5
  %28 = add nsw i32 %22, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %8, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7, !amdgpu.noclobber !5
  %32 = fadd contract double %27, %31
  %33 = fmul contract double %32, 5.000000e-01
  %34 = getelementptr inbounds double, double addrspace(1)* %4, i64 %25
  store double %33, double addrspace(1)* %34, align 8, !tbaa !7
  %35 = getelementptr inbounds double, double addrspace(1)* %6, i64 %25
  store double %2, double addrspace(1)* %35, align 8, !tbaa !7
  br label %36

36:                                               ; preds = %24, %13
  %37 = icmp slt i32 %22, %1
  br i1 %37, label %38, label %50

38:                                               ; preds = %36
  %39 = sext i32 %22 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %9, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = add nsw i32 %22, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %9, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fadd contract double %41, %45
  %47 = fmul contract double %46, 5.000000e-01
  %48 = getelementptr inbounds double, double addrspace(1)* %5, i64 %39
  store double %47, double addrspace(1)* %48, align 8, !tbaa !7
  %49 = getelementptr inbounds double, double addrspace(1)* %7, i64 %39
  store double %3, double addrspace(1)* %49, align 8, !tbaa !7
  br label %50

50:                                               ; preds = %38, %36
  %51 = mul nsw i32 %1, %0
  %52 = icmp slt i32 %22, %51
  br i1 %52, label %53, label %57

53:                                               ; preds = %50
  %54 = fmul contract double %2, %3
  %55 = sext i32 %22 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %10, i64 %55
  store double %54, double addrspace(1)* %56, align 8, !tbaa !7
  br label %57

57:                                               ; preds = %53, %50
  %58 = add nsw i32 %0, 1
  %59 = mul nsw i32 %58, %1
  %60 = icmp slt i32 %22, %59
  br i1 %60, label %61, label %64

61:                                               ; preds = %57
  %62 = sext i32 %22 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %11, i64 %62
  store double %3, double addrspace(1)* %63, align 8, !tbaa !7
  br label %64

64:                                               ; preds = %61, %57
  %65 = add nsw i32 %1, 1
  %66 = mul nsw i32 %65, %0
  %67 = icmp slt i32 %22, %66
  br i1 %67, label %68, label %71

68:                                               ; preds = %64
  %69 = sext i32 %22 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %12, i64 %69
  store double %2, double addrspace(1)* %70, align 8, !tbaa !7
  br label %71

71:                                               ; preds = %68, %64
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
