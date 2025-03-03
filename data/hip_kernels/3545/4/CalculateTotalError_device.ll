; ModuleID = '../data/hip_kernels/3545/4/main.cu'
source_filename = "../data/hip_kernels/3545/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19CalculateTotalErrorPdiE7error_s = internal unnamed_addr addrspace(3) global [512 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19CalculateTotalErrorPdi(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl nuw nsw i32 %8, 1
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %3
  %13 = icmp ult i32 %12, %1
  br i1 %13, label %14, label %18

14:                                               ; preds = %2
  %15 = zext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !6
  br label %18

18:                                               ; preds = %2, %14
  %19 = phi double [ %17, %14 ], [ 0.000000e+00, %2 ]
  %20 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ19CalculateTotalErrorPdiE7error_s, i32 0, i32 %3
  store double %19, double addrspace(3)* %20, align 8
  %21 = add nuw nsw i32 %3, %8
  %22 = add i32 %21, %11
  %23 = icmp ult i32 %22, %1
  br i1 %23, label %24, label %28

24:                                               ; preds = %18
  %25 = zext i32 %22 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %0, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !6
  br label %28

28:                                               ; preds = %18, %24
  %29 = phi double [ %27, %24 ], [ 0.000000e+00, %18 ]
  %30 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ19CalculateTotalErrorPdiE7error_s, i32 0, i32 %21
  store double %29, double addrspace(3)* %30, align 8, !tbaa !7
  br label %33

31:                                               ; preds = %42
  %32 = icmp eq i32 %3, 0
  br i1 %32, label %45, label %49

33:                                               ; preds = %28, %42
  %34 = phi i32 [ %8, %28 ], [ %43, %42 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i32 %3, %34
  br i1 %35, label %36, label %42

36:                                               ; preds = %33
  %37 = add nuw nsw i32 %34, %3
  %38 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ19CalculateTotalErrorPdiE7error_s, i32 0, i32 %37
  %39 = load double, double addrspace(3)* %38, align 8, !tbaa !7
  %40 = load double, double addrspace(3)* %20, align 8, !tbaa !7
  %41 = fadd contract double %39, %40
  store double %41, double addrspace(3)* %20, align 8, !tbaa !7
  br label %42

42:                                               ; preds = %33, %36
  %43 = lshr i32 %34, 1
  %44 = icmp ult i32 %34, 2
  br i1 %44, label %31, label %33, !llvm.loop !11

45:                                               ; preds = %31
  %46 = load double, double addrspace(3)* getelementptr inbounds ([512 x double], [512 x double] addrspace(3)* @_ZZ19CalculateTotalErrorPdiE7error_s, i32 0, i32 0), align 16, !tbaa !7
  %47 = zext i32 %9 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  store double %46, double addrspace(1)* %48, align 8, !tbaa !7
  br label %49

49:                                               ; preds = %45, %31
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
