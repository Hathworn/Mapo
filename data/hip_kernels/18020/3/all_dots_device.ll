; ModuleID = '../data/hip_kernels/18020/3/main.cu'
source_filename = "../data/hip_kernels/18020/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8all_dotsiiPdS_S_E15local_data_dots = internal unnamed_addr addrspace(3) global [32 x double] undef, align 16
@_ZZ8all_dotsiiPdS_S_E19local_centroid_dots = internal unnamed_addr addrspace(3) global [32 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z8all_dotsiiPdS_S_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %0
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %15, i1 %17, i1 false
  br i1 %18, label %19, label %24

19:                                               ; preds = %5
  %20 = sext i32 %14 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %2, i64 %20
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds [32 x double], [32 x double] addrspace(3)* @_ZZ8all_dotsiiPdS_S_E15local_data_dots, i32 0, i32 %6
  store double %22, double addrspace(3)* %23, align 8, !tbaa !7
  br label %24

24:                                               ; preds = %19, %5
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  %31 = add i32 %30, %6
  %32 = icmp slt i32 %31, %1
  %33 = icmp eq i32 %16, 1
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %40

35:                                               ; preds = %24
  %36 = sext i32 %31 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %3, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds [32 x double], [32 x double] addrspace(3)* @_ZZ8all_dotsiiPdS_S_E19local_centroid_dots, i32 0, i32 %6
  store double %38, double addrspace(3)* %39, align 8, !tbaa !7
  br label %40

40:                                               ; preds = %35, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = add i32 %30, %16
  %42 = icmp slt i32 %41, %1
  %43 = select i1 %15, i1 %42, i1 false
  br i1 %43, label %44, label %54

44:                                               ; preds = %40
  %45 = getelementptr inbounds [32 x double], [32 x double] addrspace(3)* @_ZZ8all_dotsiiPdS_S_E15local_data_dots, i32 0, i32 %6
  %46 = load double, double addrspace(3)* %45, align 8, !tbaa !7
  %47 = getelementptr inbounds [32 x double], [32 x double] addrspace(3)* @_ZZ8all_dotsiiPdS_S_E19local_centroid_dots, i32 0, i32 %16
  %48 = load double, double addrspace(3)* %47, align 8, !tbaa !7
  %49 = fadd contract double %46, %48
  %50 = mul nsw i32 %41, %0
  %51 = add nsw i32 %50, %14
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %4, i64 %52
  store double %49, double addrspace(1)* %53, align 8, !tbaa !7
  br label %54

54:                                               ; preds = %44, %40
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
