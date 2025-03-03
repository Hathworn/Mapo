; ModuleID = '../data/hip_kernels/11810/24/main.cu'
source_filename = "../data/hip_kernels/11810/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15LRMomentaKernelPdS_S_S_S_S_S_iiS_d(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, double addrspace(1)* nocapture readonly %9, double %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = icmp slt i32 %28, %7
  %30 = icmp slt i32 %20, %8
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %75

32:                                               ; preds = %11
  %33 = mul nsw i32 %28, %8
  %34 = add nsw i32 %33, %20
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %4, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7, !amdgpu.noclobber !6
  %38 = add nsw i32 %28, 1
  %39 = mul nsw i32 %38, %8
  %40 = add nsw i32 %39, %20
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %5, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !6
  %44 = fmul contract double %37, %43
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  store double %44, double addrspace(1)* %45, align 8, !tbaa !7
  %46 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %47 = getelementptr inbounds double, double addrspace(1)* %5, i64 %35
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = fmul contract double %46, %48
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  store double %49, double addrspace(1)* %50, align 8, !tbaa !7
  %51 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %52 = add nsw i32 %20, 1
  %53 = srem i32 %52, %8
  %54 = add nsw i32 %53, %33
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %6, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7
  %58 = sext i32 %28 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %9, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7
  %61 = fmul contract double %60, %10
  %62 = fadd contract double %57, %61
  %63 = fmul contract double %51, %62
  %64 = fmul contract double %60, %63
  %65 = getelementptr inbounds double, double addrspace(1)* %2, i64 %35
  store double %64, double addrspace(1)* %65, align 8, !tbaa !7
  %66 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %67 = getelementptr inbounds double, double addrspace(1)* %6, i64 %35
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = load double, double addrspace(1)* %59, align 8, !tbaa !7
  %70 = fmul contract double %69, %10
  %71 = fadd contract double %68, %70
  %72 = fmul contract double %66, %71
  %73 = fmul contract double %69, %72
  %74 = getelementptr inbounds double, double addrspace(1)* %3, i64 %35
  store double %73, double addrspace(1)* %74, align 8, !tbaa !7
  br label %75

75:                                               ; preds = %32, %11
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
