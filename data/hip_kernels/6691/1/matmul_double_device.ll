; ModuleID = '../data/hip_kernels/6691/1/main.cu'
source_filename = "../data/hip_kernels/6691/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13matmul_doublePdS_S_iiiE2SA = internal unnamed_addr addrspace(3) global [16 x [17 x double]] undef, align 16
@_ZZ13matmul_doublePdS_S_iiiE2SB = internal unnamed_addr addrspace(3) global [16 x [17 x double]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13matmul_doublePdS_S_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 4
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 4
  %14 = add nsw i32 %13, %9
  %15 = icmp slt i32 %5, -14
  br i1 %15, label %57, label %16

16:                                               ; preds = %6
  %17 = add nsw i32 %5, -1
  %18 = sdiv i32 %17, 16
  %19 = icmp slt i32 %12, %3
  %20 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 %9
  %21 = mul nsw i32 %12, %5
  %22 = icmp slt i32 %14, %4
  %23 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 %10
  %24 = mul nsw i32 %14, %5
  %25 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 0
  %26 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 0
  %27 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 1
  %28 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 1
  %29 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 2
  %30 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 2
  %31 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 3
  %32 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 3
  %33 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 4
  %34 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 4
  %35 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 5
  %36 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 5
  %37 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 6
  %38 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 6
  %39 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 7
  %40 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 7
  %41 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 8
  %42 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 8
  %43 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 9
  %44 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 9
  %45 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 10
  %46 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 10
  %47 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 11
  %48 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 11
  %49 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 12
  %50 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 12
  %51 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 13
  %52 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 13
  %53 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 14
  %54 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 14
  %55 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SA, i32 0, i32 %10, i32 15
  %56 = getelementptr inbounds [16 x [17 x double]], [16 x [17 x double]] addrspace(3)* @_ZZ13matmul_doublePdS_S_iiiE2SB, i32 0, i32 %9, i32 15
  br label %62

57:                                               ; preds = %85, %6
  %58 = phi double [ 0.000000e+00, %6 ], [ %150, %85 ]
  %59 = icmp slt i32 %12, %3
  %60 = icmp slt i32 %14, %4
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %153, label %158

62:                                               ; preds = %16, %85
  %63 = phi i32 [ 0, %16 ], [ %151, %85 ]
  %64 = phi double [ 0.000000e+00, %16 ], [ %150, %85 ]
  br i1 %19, label %65, label %74

65:                                               ; preds = %62
  %66 = shl nsw i32 %63, 4
  %67 = add nuw i32 %66, %9
  %68 = icmp slt i32 %67, %5
  br i1 %68, label %69, label %74

69:                                               ; preds = %65
  %70 = add i32 %67, %21
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %0, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %74

74:                                               ; preds = %62, %65, %69
  %75 = phi double [ %73, %69 ], [ 0.000000e+00, %65 ], [ 0.000000e+00, %62 ]
  store double %75, double addrspace(3)* %20, align 8, !tbaa !5
  br i1 %22, label %76, label %85

76:                                               ; preds = %74
  %77 = shl nsw i32 %63, 4
  %78 = add nuw i32 %77, %10
  %79 = icmp slt i32 %78, %5
  br i1 %79, label %80, label %85

80:                                               ; preds = %76
  %81 = add i32 %78, %24
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %85

85:                                               ; preds = %74, %76, %80
  %86 = phi double [ %84, %80 ], [ 0.000000e+00, %76 ], [ 0.000000e+00, %74 ]
  store double %86, double addrspace(3)* %23, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = load double, double addrspace(3)* %25, align 8, !tbaa !5
  %88 = load double, double addrspace(3)* %26, align 8, !tbaa !5
  %89 = fmul contract double %87, %88
  %90 = fadd contract double %64, %89
  %91 = load double, double addrspace(3)* %27, align 8, !tbaa !5
  %92 = load double, double addrspace(3)* %28, align 8, !tbaa !5
  %93 = fmul contract double %91, %92
  %94 = fadd contract double %90, %93
  %95 = load double, double addrspace(3)* %29, align 8, !tbaa !5
  %96 = load double, double addrspace(3)* %30, align 8, !tbaa !5
  %97 = fmul contract double %95, %96
  %98 = fadd contract double %94, %97
  %99 = load double, double addrspace(3)* %31, align 8, !tbaa !5
  %100 = load double, double addrspace(3)* %32, align 8, !tbaa !5
  %101 = fmul contract double %99, %100
  %102 = fadd contract double %98, %101
  %103 = load double, double addrspace(3)* %33, align 8, !tbaa !5
  %104 = load double, double addrspace(3)* %34, align 8, !tbaa !5
  %105 = fmul contract double %103, %104
  %106 = fadd contract double %102, %105
  %107 = load double, double addrspace(3)* %35, align 8, !tbaa !5
  %108 = load double, double addrspace(3)* %36, align 8, !tbaa !5
  %109 = fmul contract double %107, %108
  %110 = fadd contract double %106, %109
  %111 = load double, double addrspace(3)* %37, align 8, !tbaa !5
  %112 = load double, double addrspace(3)* %38, align 8, !tbaa !5
  %113 = fmul contract double %111, %112
  %114 = fadd contract double %110, %113
  %115 = load double, double addrspace(3)* %39, align 8, !tbaa !5
  %116 = load double, double addrspace(3)* %40, align 8, !tbaa !5
  %117 = fmul contract double %115, %116
  %118 = fadd contract double %114, %117
  %119 = load double, double addrspace(3)* %41, align 8, !tbaa !5
  %120 = load double, double addrspace(3)* %42, align 8, !tbaa !5
  %121 = fmul contract double %119, %120
  %122 = fadd contract double %118, %121
  %123 = load double, double addrspace(3)* %43, align 8, !tbaa !5
  %124 = load double, double addrspace(3)* %44, align 8, !tbaa !5
  %125 = fmul contract double %123, %124
  %126 = fadd contract double %122, %125
  %127 = load double, double addrspace(3)* %45, align 8, !tbaa !5
  %128 = load double, double addrspace(3)* %46, align 8, !tbaa !5
  %129 = fmul contract double %127, %128
  %130 = fadd contract double %126, %129
  %131 = load double, double addrspace(3)* %47, align 8, !tbaa !5
  %132 = load double, double addrspace(3)* %48, align 8, !tbaa !5
  %133 = fmul contract double %131, %132
  %134 = fadd contract double %130, %133
  %135 = load double, double addrspace(3)* %49, align 8, !tbaa !5
  %136 = load double, double addrspace(3)* %50, align 8, !tbaa !5
  %137 = fmul contract double %135, %136
  %138 = fadd contract double %134, %137
  %139 = load double, double addrspace(3)* %51, align 8, !tbaa !5
  %140 = load double, double addrspace(3)* %52, align 8, !tbaa !5
  %141 = fmul contract double %139, %140
  %142 = fadd contract double %138, %141
  %143 = load double, double addrspace(3)* %53, align 8, !tbaa !5
  %144 = load double, double addrspace(3)* %54, align 8, !tbaa !5
  %145 = fmul contract double %143, %144
  %146 = fadd contract double %142, %145
  %147 = load double, double addrspace(3)* %55, align 8, !tbaa !5
  %148 = load double, double addrspace(3)* %56, align 8, !tbaa !5
  %149 = fmul contract double %147, %148
  %150 = fadd contract double %146, %149
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = add nuw nsw i32 %63, 1
  %152 = icmp eq i32 %63, %18
  br i1 %152, label %57, label %62, !llvm.loop !10

153:                                              ; preds = %57
  %154 = mul nsw i32 %12, %4
  %155 = add nsw i32 %154, %14
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds double, double addrspace(1)* %2, i64 %156
  store double %58, double addrspace(1)* %157, align 8, !tbaa !5
  br label %158

158:                                              ; preds = %153, %57
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
!11 = !{!"llvm.loop.mustprogress"}
