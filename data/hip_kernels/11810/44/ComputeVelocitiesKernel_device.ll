; ModuleID = '../data/hip_kernels/11810/44/main.cu'
source_filename = "../data/hip_kernels/11810/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23ComputeVelocitiesKernelPdS_S_S_S_S_S_S_iid(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, double %10) local_unnamed_addr #0 {
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
  %29 = icmp slt i32 %28, %8
  %30 = icmp slt i32 %20, %9
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %86

32:                                               ; preds = %11
  %33 = icmp eq i32 %28, 0
  br i1 %33, label %34, label %38

34:                                               ; preds = %32
  %35 = sext i32 %20 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  store double 0.000000e+00, double addrspace(1)* %36, align 8, !tbaa !7
  %37 = sext i32 %20 to i64
  br label %59

38:                                               ; preds = %32
  %39 = add nsw i32 %28, -1
  %40 = mul nsw i32 %39, %9
  %41 = add nsw i32 %40, %20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %6, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !6
  %45 = mul nsw i32 %28, %9
  %46 = add nsw i32 %45, %20
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %7, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7, !amdgpu.noclobber !6
  %50 = fadd contract double %44, %49
  %51 = getelementptr inbounds double, double addrspace(1)* %2, i64 %47
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7, !amdgpu.noclobber !6
  %53 = getelementptr inbounds double, double addrspace(1)* %2, i64 %42
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !6
  %55 = fadd contract double %52, %54
  %56 = fadd contract double %55, 0x3BC79CA10C924223
  %57 = fdiv contract double %50, %56
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  store double %57, double addrspace(1)* %58, align 8, !tbaa !7
  br label %59

59:                                               ; preds = %38, %34
  %60 = phi i64 [ %47, %38 ], [ %37, %34 ]
  %61 = phi i32 [ %45, %38 ], [ 0, %34 ]
  %62 = add nsw i32 %9, -1
  %63 = add i32 %62, %20
  %64 = srem i32 %63, %9
  %65 = add nsw i32 %64, %61
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %4, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = getelementptr inbounds double, double addrspace(1)* %5, i64 %60
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = fadd contract double %68, %70
  %72 = getelementptr inbounds double, double addrspace(1)* %2, i64 %60
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !7
  %74 = getelementptr inbounds double, double addrspace(1)* %2, i64 %66
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %76 = fadd contract double %73, %75
  %77 = fadd contract double %76, 1.000000e-15
  %78 = fdiv contract double %71, %77
  %79 = sext i32 %28 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %3, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = fdiv contract double %78, %81
  %83 = fmul contract double %81, %10
  %84 = fsub contract double %82, %83
  %85 = getelementptr inbounds double, double addrspace(1)* %1, i64 %60
  store double %84, double addrspace(1)* %85, align 8, !tbaa !7
  br label %86

86:                                               ; preds = %59, %11
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
