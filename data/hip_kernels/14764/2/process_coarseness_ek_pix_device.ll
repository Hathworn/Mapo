; ModuleID = '../data/hip_kernels/14764/2/main.cu'
source_filename = "../data/hip_kernels/14764/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25process_coarseness_ek_pixPdS_S_iil(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = trunc i64 %5 to i32
  %25 = add i32 %23, %24
  %26 = sub i32 %23, %24
  %27 = add i32 %15, %24
  %28 = sub i32 %15, %24
  %29 = icmp slt i32 %15, %3
  %30 = icmp slt i32 %23, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %75

32:                                               ; preds = %6
  %33 = icmp slt i32 %25, %4
  %34 = icmp sgt i32 %26, -1
  %35 = and i1 %33, %34
  %36 = mul nsw i32 %15, %4
  br i1 %35, label %37, label %48

37:                                               ; preds = %32
  %38 = add nsw i32 %25, %36
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !6
  %42 = add nsw i32 %26, %36
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7, !amdgpu.noclobber !6
  %46 = fsub contract double %41, %45
  %47 = tail call double @llvm.fabs.f64(double %46)
  br label %48

48:                                               ; preds = %32, %37
  %49 = phi double [ %47, %37 ], [ 0.000000e+00, %32 ]
  %50 = add nsw i32 %36, %23
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  store double %49, double addrspace(1)* %52, align 8, !tbaa !7
  %53 = icmp slt i32 %27, %3
  %54 = icmp sgt i32 %28, -1
  %55 = and i1 %53, %54
  br i1 %55, label %56, label %69

56:                                               ; preds = %48
  %57 = mul nsw i32 %27, %4
  %58 = add nsw i32 %57, %23
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7
  %62 = mul nsw i32 %28, %4
  %63 = add nsw i32 %62, %23
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = fsub contract double %61, %66
  %68 = tail call double @llvm.fabs.f64(double %67)
  br label %69

69:                                               ; preds = %48, %56
  %70 = phi double [ %68, %56 ], [ 0.000000e+00, %48 ]
  %71 = mul nsw i32 %15, %4
  %72 = add nsw i32 %71, %23
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %2, i64 %73
  store double %70, double addrspace(1)* %74, align 8, !tbaa !7
  br label %75

75:                                               ; preds = %69, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
