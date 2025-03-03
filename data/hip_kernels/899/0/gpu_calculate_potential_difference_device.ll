; ModuleID = '../data/hip_kernels/899/0/main.cu'
source_filename = "../data/hip_kernels/899/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ34gpu_calculate_potential_differenceiiPKdS0_PdE6s_diff = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z34gpu_calculate_potential_differenceiiPKdS0_Pd(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ34gpu_calculate_potential_differenceiiPKdS0_PdE6s_diff, i32 0, i32 %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %9, label %39

9:                                                ; preds = %5
  %10 = and i32 %1, 3
  %11 = icmp ult i32 %1, 4
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = and i32 %1, -4
  br label %48

14:                                               ; preds = %105, %9
  %15 = phi double [ undef, %9 ], [ %106, %105 ]
  %16 = phi double [ 0.000000e+00, %9 ], [ %106, %105 ]
  %17 = phi i32 [ 0, %9 ], [ %107, %105 ]
  %18 = icmp eq i32 %10, 0
  br i1 %18, label %39, label %19

19:                                               ; preds = %14, %34
  %20 = phi double [ %35, %34 ], [ %16, %14 ]
  %21 = phi i32 [ %36, %34 ], [ %17, %14 ]
  %22 = phi i32 [ %37, %34 ], [ 0, %14 ]
  %23 = shl nsw i32 %21, 10
  %24 = or i32 %23, %6
  %25 = icmp slt i32 %24, %0
  br i1 %25, label %26, label %34

26:                                               ; preds = %19
  %27 = zext i32 %24 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %3, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !5, !amdgpu.noclobber !9
  %30 = getelementptr inbounds double, double addrspace(1)* %2, i64 %27
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !5, !amdgpu.noclobber !9
  %32 = fsub contract double %29, %31
  %33 = fadd contract double %20, %32
  br label %34

34:                                               ; preds = %26, %19
  %35 = phi double [ %33, %26 ], [ %20, %19 ]
  %36 = add nuw nsw i32 %21, 1
  %37 = add i32 %22, 1
  %38 = icmp eq i32 %37, %10
  br i1 %38, label %39, label %19, !llvm.loop !10

39:                                               ; preds = %14, %34, %5
  %40 = phi double [ 0.000000e+00, %5 ], [ %15, %14 ], [ %35, %34 ]
  store double %40, double addrspace(3)* %7, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %42 = getelementptr i8, i8 addrspace(4)* %41, i64 4
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 4, !range !12, !invariant.load !9
  %45 = icmp ult i16 %44, 2
  br i1 %45, label %110, label %46

46:                                               ; preds = %39
  %47 = zext i16 %44 to i32
  br label %112

48:                                               ; preds = %105, %12
  %49 = phi double [ 0.000000e+00, %12 ], [ %106, %105 ]
  %50 = phi i32 [ 0, %12 ], [ %107, %105 ]
  %51 = phi i32 [ 0, %12 ], [ %108, %105 ]
  %52 = shl nsw i32 %50, 10
  %53 = or i32 %52, %6
  %54 = icmp slt i32 %53, %0
  br i1 %54, label %55, label %63

55:                                               ; preds = %48
  %56 = zext i32 %53 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %3, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !5, !amdgpu.noclobber !9
  %59 = getelementptr inbounds double, double addrspace(1)* %2, i64 %56
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !5, !amdgpu.noclobber !9
  %61 = fsub contract double %58, %60
  %62 = fadd contract double %49, %61
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi double [ %62, %55 ], [ %49, %48 ]
  %65 = shl i32 %50, 10
  %66 = or i32 %65, %6
  %67 = or i32 %66, 1024
  %68 = icmp slt i32 %67, %0
  br i1 %68, label %69, label %77

69:                                               ; preds = %63
  %70 = zext i32 %67 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %3, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !5, !amdgpu.noclobber !9
  %73 = getelementptr inbounds double, double addrspace(1)* %2, i64 %70
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !5, !amdgpu.noclobber !9
  %75 = fsub contract double %72, %74
  %76 = fadd contract double %64, %75
  br label %77

77:                                               ; preds = %69, %63
  %78 = phi double [ %76, %69 ], [ %64, %63 ]
  %79 = shl i32 %50, 10
  %80 = or i32 %79, %6
  %81 = or i32 %80, 2048
  %82 = icmp slt i32 %81, %0
  br i1 %82, label %83, label %91

83:                                               ; preds = %77
  %84 = zext i32 %81 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %3, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !5, !amdgpu.noclobber !9
  %87 = getelementptr inbounds double, double addrspace(1)* %2, i64 %84
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !5, !amdgpu.noclobber !9
  %89 = fsub contract double %86, %88
  %90 = fadd contract double %78, %89
  br label %91

91:                                               ; preds = %83, %77
  %92 = phi double [ %90, %83 ], [ %78, %77 ]
  %93 = shl i32 %50, 10
  %94 = or i32 %93, %6
  %95 = or i32 %94, 3072
  %96 = icmp slt i32 %95, %0
  br i1 %96, label %97, label %105

97:                                               ; preds = %91
  %98 = zext i32 %95 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %3, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !5, !amdgpu.noclobber !9
  %101 = getelementptr inbounds double, double addrspace(1)* %2, i64 %98
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !5, !amdgpu.noclobber !9
  %103 = fsub contract double %100, %102
  %104 = fadd contract double %92, %103
  br label %105

105:                                              ; preds = %97, %91
  %106 = phi double [ %104, %97 ], [ %92, %91 ]
  %107 = add nuw nsw i32 %50, 4
  %108 = add i32 %51, 4
  %109 = icmp eq i32 %108, %13
  br i1 %109, label %14, label %48, !llvm.loop !13

110:                                              ; preds = %122, %39
  %111 = icmp eq i32 %6, 0
  br i1 %111, label %124, label %126

112:                                              ; preds = %46, %122
  %113 = phi i32 [ %114, %122 ], [ %47, %46 ]
  %114 = lshr i32 %113, 1
  %115 = icmp ult i32 %6, %114
  br i1 %115, label %116, label %122

116:                                              ; preds = %112
  %117 = add nuw nsw i32 %114, %6
  %118 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ34gpu_calculate_potential_differenceiiPKdS0_PdE6s_diff, i32 0, i32 %117
  %119 = load double, double addrspace(3)* %118, align 8, !tbaa !5
  %120 = load double, double addrspace(3)* %7, align 8, !tbaa !5
  %121 = fadd contract double %119, %120
  store double %121, double addrspace(3)* %7, align 8, !tbaa !5
  br label %122

122:                                              ; preds = %116, %112
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = icmp ult i32 %113, 4
  br i1 %123, label %110, label %112, !llvm.loop !15

124:                                              ; preds = %110
  %125 = load double, double addrspace(3)* getelementptr inbounds ([1024 x double], [1024 x double] addrspace(3)* @_ZZ34gpu_calculate_potential_differenceiiPKdS0_PdE6s_diff, i32 0, i32 0), align 16, !tbaa !5
  store double %125, double addrspace(1)* %4, align 8, !tbaa !5
  br label %126

126:                                              ; preds = %124, %110
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!12 = !{i16 1, i16 1025}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
