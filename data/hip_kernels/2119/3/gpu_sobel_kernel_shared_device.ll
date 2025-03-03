; ModuleID = '../data/hip_kernels/2119/3/main.cu'
source_filename = "../data/hip_kernels/2119/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile = internal unnamed_addr addrspace(3) global [24 x [24 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z23gpu_sobel_kernel_sharedPhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = mul i32 %7, 22
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, 22
  %12 = add i32 %11, %5
  %13 = mul i32 %9, %2
  %14 = add i32 %13, %12
  %15 = icmp eq i32 %9, 0
  br i1 %15, label %78, label %16

16:                                               ; preds = %4
  %17 = add i32 %3, -1
  %18 = icmp ult i32 %9, %17
  %19 = icmp ne i32 %12, 0
  %20 = select i1 %18, i1 %19, i1 false
  %21 = add i32 %2, -1
  %22 = icmp ult i32 %12, %21
  %23 = select i1 %20, i1 %22, i1 false
  br i1 %23, label %24, label %78

24:                                               ; preds = %16
  %25 = sext i32 %14 to i64
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %25
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !5, !amdgpu.noclobber !8
  %28 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %5, i32 %6
  store i8 %27, i8 addrspace(3)* %28, align 1, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = icmp ne i32 %6, 0
  %30 = add nsw i32 %5, -1
  %31 = icmp ult i32 %30, 22
  %32 = select i1 %31, i1 %29, i1 false
  %33 = icmp ult i32 %6, 23
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %78

35:                                               ; preds = %24
  %36 = add nsw i32 %6, -1
  %37 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %30, i32 %36
  %38 = load i8, i8 addrspace(3)* %37, align 1, !tbaa !5
  %39 = zext i8 %38 to i32
  %40 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %30, i32 %6
  %41 = load i8, i8 addrspace(3)* %40, align 1, !tbaa !5
  %42 = zext i8 %41 to i32
  %43 = add nuw nsw i32 %6, 1
  %44 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %30, i32 %43
  %45 = load i8, i8 addrspace(3)* %44, align 1, !tbaa !5
  %46 = zext i8 %45 to i32
  %47 = add nuw nsw i32 %5, 1
  %48 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %47, i32 %36
  %49 = load i8, i8 addrspace(3)* %48, align 1, !tbaa !5
  %50 = zext i8 %49 to i32
  %51 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %47, i32 %6
  %52 = load i8, i8 addrspace(3)* %51, align 1, !tbaa !5
  %53 = zext i8 %52 to i32
  %54 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %47, i32 %43
  %55 = load i8, i8 addrspace(3)* %54, align 1, !tbaa !5
  %56 = zext i8 %55 to i32
  %57 = add nuw nsw i32 %42, %39
  %58 = add nuw nsw i32 %57, %46
  %59 = add nuw nsw i32 %50, %53
  %60 = add nuw nsw i32 %59, %56
  %61 = sub nsw i32 %58, %60
  %62 = tail call i32 @llvm.abs.i32(i32 %61, i1 true)
  %63 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %5, i32 %36
  %64 = load i8, i8 addrspace(3)* %63, align 1, !tbaa !5
  %65 = zext i8 %64 to i32
  %66 = getelementptr inbounds [24 x [24 x i8]], [24 x [24 x i8]] addrspace(3)* @_ZZ23gpu_sobel_kernel_sharedPhS_jjE5tuile, i32 0, i32 %5, i32 %43
  %67 = load i8, i8 addrspace(3)* %66, align 1, !tbaa !5
  %68 = zext i8 %67 to i32
  %69 = add nuw nsw i32 %39, %50
  %70 = add nuw nsw i32 %46, %56
  %71 = add nuw nsw i32 %69, %65
  %72 = add nuw nsw i32 %70, %68
  %73 = sub nsw i32 %71, %72
  %74 = tail call i32 @llvm.abs.i32(i32 %73, i1 true)
  %75 = add nuw nsw i32 %74, %62
  %76 = trunc i32 %75 to i8
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %25
  store i8 %76, i8 addrspace(1)* %77, align 1, !tbaa !5
  br label %78

78:                                               ; preds = %24, %35, %4, %16
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
