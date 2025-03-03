; ModuleID = '../data/hip_kernels/10426/1/main.cu'
source_filename = "../data/hip_kernels/10426/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@dots_s = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5gaxpyPdS_S_ii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp slt i32 %6, %3
  %9 = icmp slt i32 %7, %4
  %10 = select i1 %8, i1 %9, i1 false
  br i1 %10, label %11, label %102

11:                                               ; preds = %5
  %12 = mul nsw i32 %6, %4
  %13 = add nsw i32 %12, %7
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double, double addrspace(1)* %1, i64 %14
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !5, !amdgpu.noclobber !9
  %17 = zext i32 %7 to i64
  %18 = getelementptr inbounds double, double addrspace(1)* %2, i64 %17
  %19 = load double, double addrspace(1)* %18, align 8, !tbaa !5, !amdgpu.noclobber !9
  %20 = fmul contract double %16, %19
  %21 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %13
  store double %20, double addrspace(3)* %21, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = icmp eq i32 %7, 0
  br i1 %22, label %23, label %102

23:                                               ; preds = %11
  %24 = icmp ugt i32 %4, 1
  %25 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %12
  %26 = load double, double addrspace(3)* %25, align 8, !tbaa !5
  br i1 %24, label %27, label %52

27:                                               ; preds = %23
  %28 = add i32 %4, -1
  %29 = add i32 %4, -2
  %30 = and i32 %28, 7
  %31 = icmp ult i32 %29, 7
  br i1 %31, label %34, label %32

32:                                               ; preds = %27
  %33 = and i32 %28, -8
  br label %56

34:                                               ; preds = %56, %27
  %35 = phi double [ undef, %27 ], [ %98, %56 ]
  %36 = phi double [ %26, %27 ], [ %98, %56 ]
  %37 = phi i32 [ 1, %27 ], [ %99, %56 ]
  %38 = icmp eq i32 %30, 0
  br i1 %38, label %50, label %39

39:                                               ; preds = %34, %39
  %40 = phi double [ %46, %39 ], [ %36, %34 ]
  %41 = phi i32 [ %47, %39 ], [ %37, %34 ]
  %42 = phi i32 [ %48, %39 ], [ 0, %34 ]
  %43 = add nsw i32 %41, %12
  %44 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %43
  %45 = load double, double addrspace(3)* %44, align 8, !tbaa !5
  %46 = fadd contract double %45, %40
  %47 = add nuw nsw i32 %41, 1
  %48 = add i32 %42, 1
  %49 = icmp eq i32 %48, %30
  br i1 %49, label %50, label %39, !llvm.loop !10

50:                                               ; preds = %39, %34
  %51 = phi double [ %35, %34 ], [ %46, %39 ]
  store double %51, double addrspace(3)* %25, align 8, !tbaa !5
  br label %52

52:                                               ; preds = %23, %50
  %53 = phi double [ %51, %50 ], [ %26, %23 ]
  %54 = sext i32 %6 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %54
  store double %53, double addrspace(1)* %55, align 8, !tbaa !5
  br label %102

56:                                               ; preds = %56, %32
  %57 = phi double [ %26, %32 ], [ %98, %56 ]
  %58 = phi i32 [ 1, %32 ], [ %99, %56 ]
  %59 = phi i32 [ 0, %32 ], [ %100, %56 ]
  %60 = add nsw i32 %58, %12
  %61 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %60
  %62 = load double, double addrspace(3)* %61, align 8, !tbaa !5
  %63 = fadd contract double %62, %57
  %64 = add nuw nsw i32 %58, 1
  %65 = add nsw i32 %64, %12
  %66 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %65
  %67 = load double, double addrspace(3)* %66, align 8, !tbaa !5
  %68 = fadd contract double %67, %63
  %69 = add nuw nsw i32 %58, 2
  %70 = add nsw i32 %69, %12
  %71 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %70
  %72 = load double, double addrspace(3)* %71, align 8, !tbaa !5
  %73 = fadd contract double %72, %68
  %74 = add nuw nsw i32 %58, 3
  %75 = add nsw i32 %74, %12
  %76 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %75
  %77 = load double, double addrspace(3)* %76, align 8, !tbaa !5
  %78 = fadd contract double %77, %73
  %79 = add nuw nsw i32 %58, 4
  %80 = add nsw i32 %79, %12
  %81 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %80
  %82 = load double, double addrspace(3)* %81, align 8, !tbaa !5
  %83 = fadd contract double %82, %78
  %84 = add nuw nsw i32 %58, 5
  %85 = add nsw i32 %84, %12
  %86 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %85
  %87 = load double, double addrspace(3)* %86, align 8, !tbaa !5
  %88 = fadd contract double %87, %83
  %89 = add nuw nsw i32 %58, 6
  %90 = add nsw i32 %89, %12
  %91 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %90
  %92 = load double, double addrspace(3)* %91, align 8, !tbaa !5
  %93 = fadd contract double %92, %88
  %94 = add nuw nsw i32 %58, 7
  %95 = add nsw i32 %94, %12
  %96 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @dots_s, i32 0, i32 %95
  %97 = load double, double addrspace(3)* %96, align 8, !tbaa !5
  %98 = fadd contract double %97, %93
  %99 = add nuw nsw i32 %58, 8
  %100 = add i32 %59, 8
  %101 = icmp eq i32 %100, %33
  br i1 %101, label %34, label %56, !llvm.loop !12

102:                                              ; preds = %52, %11, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
