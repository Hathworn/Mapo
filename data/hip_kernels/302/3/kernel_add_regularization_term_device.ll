; ModuleID = '../data/hip_kernels/302/3/main.cu'
source_filename = "../data/hip_kernels/302/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30kernel_add_regularization_termPdidS_(double addrspace(1)* nocapture readonly %0, i32 %1, double %2, double addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %109

7:                                                ; preds = %4
  %8 = icmp sgt i32 %1, 1
  br i1 %8, label %9, label %35

9:                                                ; preds = %7
  %10 = add i32 %1, -1
  %11 = add i32 %1, -2
  %12 = and i32 %10, 7
  %13 = icmp ult i32 %11, 7
  br i1 %13, label %16, label %14

14:                                               ; preds = %9
  %15 = and i32 %10, -8
  br label %39

16:                                               ; preds = %39, %9
  %17 = phi double [ undef, %9 ], [ %105, %39 ]
  %18 = phi i32 [ 1, %9 ], [ %106, %39 ]
  %19 = phi double [ 0.000000e+00, %9 ], [ %105, %39 ]
  %20 = icmp eq i32 %12, 0
  br i1 %20, label %35, label %21

21:                                               ; preds = %16, %21
  %22 = phi i32 [ %32, %21 ], [ %18, %16 ]
  %23 = phi double [ %31, %21 ], [ %19, %16 ]
  %24 = phi i32 [ %33, %21 ], [ 0, %16 ]
  %25 = zext i32 %22 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %0, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !5, !amdgpu.noclobber !9
  %28 = fmul contract double %27, 5.000000e-01
  %29 = fmul contract double %27, %28
  %30 = fmul contract double %29, %2
  %31 = fadd contract double %23, %30
  %32 = add nuw nsw i32 %22, 1
  %33 = add i32 %24, 1
  %34 = icmp eq i32 %33, %12
  br i1 %34, label %35, label %21, !llvm.loop !10

35:                                               ; preds = %16, %21, %7
  %36 = phi double [ 0.000000e+00, %7 ], [ %17, %16 ], [ %31, %21 ]
  %37 = load double, double addrspace(1)* %3, align 8, !tbaa !5, !amdgpu.noclobber !9
  %38 = fadd contract double %36, %37
  store double %38, double addrspace(1)* %3, align 8, !tbaa !5
  br label %109

39:                                               ; preds = %39, %14
  %40 = phi i32 [ 1, %14 ], [ %106, %39 ]
  %41 = phi double [ 0.000000e+00, %14 ], [ %105, %39 ]
  %42 = phi i32 [ 0, %14 ], [ %107, %39 ]
  %43 = zext i32 %40 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !5, !amdgpu.noclobber !9
  %46 = fmul contract double %45, 5.000000e-01
  %47 = fmul contract double %45, %46
  %48 = fmul contract double %47, %2
  %49 = fadd contract double %41, %48
  %50 = add nuw nsw i32 %40, 1
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !5, !amdgpu.noclobber !9
  %54 = fmul contract double %53, 5.000000e-01
  %55 = fmul contract double %53, %54
  %56 = fmul contract double %55, %2
  %57 = fadd contract double %49, %56
  %58 = add nuw nsw i32 %40, 2
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !5, !amdgpu.noclobber !9
  %62 = fmul contract double %61, 5.000000e-01
  %63 = fmul contract double %61, %62
  %64 = fmul contract double %63, %2
  %65 = fadd contract double %57, %64
  %66 = add nuw nsw i32 %40, 3
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !5, !amdgpu.noclobber !9
  %70 = fmul contract double %69, 5.000000e-01
  %71 = fmul contract double %69, %70
  %72 = fmul contract double %71, %2
  %73 = fadd contract double %65, %72
  %74 = add nuw nsw i32 %40, 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !5, !amdgpu.noclobber !9
  %78 = fmul contract double %77, 5.000000e-01
  %79 = fmul contract double %77, %78
  %80 = fmul contract double %79, %2
  %81 = fadd contract double %73, %80
  %82 = add nuw nsw i32 %40, 5
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !5, !amdgpu.noclobber !9
  %86 = fmul contract double %85, 5.000000e-01
  %87 = fmul contract double %85, %86
  %88 = fmul contract double %87, %2
  %89 = fadd contract double %81, %88
  %90 = add nuw nsw i32 %40, 6
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %0, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !5, !amdgpu.noclobber !9
  %94 = fmul contract double %93, 5.000000e-01
  %95 = fmul contract double %93, %94
  %96 = fmul contract double %95, %2
  %97 = fadd contract double %89, %96
  %98 = add nuw nsw i32 %40, 7
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %0, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !5, !amdgpu.noclobber !9
  %102 = fmul contract double %101, 5.000000e-01
  %103 = fmul contract double %101, %102
  %104 = fmul contract double %103, %2
  %105 = fadd contract double %97, %104
  %106 = add nuw nsw i32 %40, 8
  %107 = add i32 %42, 8
  %108 = icmp eq i32 %107, %15
  br i1 %108, label %16, label %39, !llvm.loop !12

109:                                              ; preds = %35, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
