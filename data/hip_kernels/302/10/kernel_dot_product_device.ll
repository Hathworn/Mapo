; ModuleID = '../data/hip_kernels/302/10/main.cu'
source_filename = "../data/hip_kernels/302/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@products = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18kernel_dot_productPKdS0_iPd(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds double, double addrspace(1)* %0, i64 %6
  %8 = load double, double addrspace(1)* %7, align 8, !tbaa !5, !amdgpu.noclobber !9
  %9 = getelementptr inbounds double, double addrspace(1)* %1, i64 %6
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !5, !amdgpu.noclobber !9
  %11 = fmul contract double %8, %10
  %12 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %5
  store double %11, double addrspace(3)* %12, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %14, label %76

14:                                               ; preds = %4
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %36

16:                                               ; preds = %14
  %17 = and i32 %2, 7
  %18 = icmp ult i32 %2, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %16
  %20 = and i32 %2, -8
  br label %38

21:                                               ; preds = %38, %16
  %22 = phi double [ undef, %16 ], [ %72, %38 ]
  %23 = phi i32 [ 0, %16 ], [ %73, %38 ]
  %24 = phi double [ 0.000000e+00, %16 ], [ %72, %38 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %36, label %26

26:                                               ; preds = %21, %26
  %27 = phi i32 [ %33, %26 ], [ %23, %21 ]
  %28 = phi double [ %32, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %34, %26 ], [ 0, %21 ]
  %30 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %27
  %31 = load double, double addrspace(3)* %30, align 8, !tbaa !5
  %32 = fadd contract double %28, %31
  %33 = add nuw nsw i32 %27, 1
  %34 = add i32 %29, 1
  %35 = icmp eq i32 %34, %17
  br i1 %35, label %36, label %26, !llvm.loop !10

36:                                               ; preds = %21, %26, %14
  %37 = phi double [ 0.000000e+00, %14 ], [ %22, %21 ], [ %32, %26 ]
  store double %37, double addrspace(1)* %3, align 8, !tbaa !5
  br label %76

38:                                               ; preds = %38, %19
  %39 = phi i32 [ 0, %19 ], [ %73, %38 ]
  %40 = phi double [ 0.000000e+00, %19 ], [ %72, %38 ]
  %41 = phi i32 [ 0, %19 ], [ %74, %38 ]
  %42 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %39
  %43 = load double, double addrspace(3)* %42, align 8, !tbaa !5
  %44 = fadd contract double %40, %43
  %45 = or i32 %39, 1
  %46 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %45
  %47 = load double, double addrspace(3)* %46, align 8, !tbaa !5
  %48 = fadd contract double %44, %47
  %49 = or i32 %39, 2
  %50 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %49
  %51 = load double, double addrspace(3)* %50, align 8, !tbaa !5
  %52 = fadd contract double %48, %51
  %53 = or i32 %39, 3
  %54 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %53
  %55 = load double, double addrspace(3)* %54, align 8, !tbaa !5
  %56 = fadd contract double %52, %55
  %57 = or i32 %39, 4
  %58 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %57
  %59 = load double, double addrspace(3)* %58, align 8, !tbaa !5
  %60 = fadd contract double %56, %59
  %61 = or i32 %39, 5
  %62 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %61
  %63 = load double, double addrspace(3)* %62, align 8, !tbaa !5
  %64 = fadd contract double %60, %63
  %65 = or i32 %39, 6
  %66 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %65
  %67 = load double, double addrspace(3)* %66, align 8, !tbaa !5
  %68 = fadd contract double %64, %67
  %69 = or i32 %39, 7
  %70 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @products, i32 0, i32 %69
  %71 = load double, double addrspace(3)* %70, align 8, !tbaa !5
  %72 = fadd contract double %68, %71
  %73 = add nuw nsw i32 %39, 8
  %74 = add nuw i32 %41, 8
  %75 = icmp eq i32 %74, %20
  br i1 %75, label %21, label %38, !llvm.loop !12

76:                                               ; preds = %36, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
