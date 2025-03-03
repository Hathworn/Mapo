; ModuleID = '../data/hip_kernels/899/1/main.cu'
source_filename = "../data/hip_kernels/899/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ30gpu_calculate_force_square_maxiiPKdPdE14s_force_square = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30gpu_calculate_force_square_maxiiPKdPd(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ30gpu_calculate_force_square_maxiiPKdPdE14s_force_square, i32 0, i32 %5
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %8, label %37

8:                                                ; preds = %4
  %9 = and i32 %1, 7
  %10 = icmp ult i32 %1, 8
  br i1 %10, label %13, label %11

11:                                               ; preds = %8
  %12 = and i32 %1, -8
  br label %46

13:                                               ; preds = %151, %8
  %14 = phi double [ undef, %8 ], [ %152, %151 ]
  %15 = phi double [ 0.000000e+00, %8 ], [ %152, %151 ]
  %16 = phi i32 [ 0, %8 ], [ %153, %151 ]
  %17 = icmp eq i32 %9, 0
  br i1 %17, label %37, label %18

18:                                               ; preds = %13, %32
  %19 = phi double [ %33, %32 ], [ %15, %13 ]
  %20 = phi i32 [ %34, %32 ], [ %16, %13 ]
  %21 = phi i32 [ %35, %32 ], [ 0, %13 ]
  %22 = shl nsw i32 %20, 10
  %23 = or i32 %22, %5
  %24 = icmp slt i32 %23, %0
  br i1 %24, label %25, label %32

25:                                               ; preds = %18
  %26 = zext i32 %23 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %2, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !5, !amdgpu.noclobber !9
  %29 = fmul contract double %28, %28
  %30 = fcmp contract ogt double %29, %19
  %31 = select i1 %30, double %29, double %19
  br label %32

32:                                               ; preds = %25, %18
  %33 = phi double [ %31, %25 ], [ %19, %18 ]
  %34 = add nuw nsw i32 %20, 1
  %35 = add i32 %21, 1
  %36 = icmp eq i32 %35, %9
  br i1 %36, label %37, label %18, !llvm.loop !10

37:                                               ; preds = %13, %32, %4
  %38 = phi double [ 0.000000e+00, %4 ], [ %14, %13 ], [ %33, %32 ]
  store double %38, double addrspace(3)* %6, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %40 = getelementptr i8, i8 addrspace(4)* %39, i64 4
  %41 = bitcast i8 addrspace(4)* %40 to i16 addrspace(4)*
  %42 = load i16, i16 addrspace(4)* %41, align 4, !range !12, !invariant.load !9
  %43 = icmp ult i16 %42, 2
  br i1 %43, label %156, label %44

44:                                               ; preds = %37
  %45 = zext i16 %42 to i32
  br label %158

46:                                               ; preds = %151, %11
  %47 = phi double [ 0.000000e+00, %11 ], [ %152, %151 ]
  %48 = phi i32 [ 0, %11 ], [ %153, %151 ]
  %49 = phi i32 [ 0, %11 ], [ %154, %151 ]
  %50 = shl nsw i32 %48, 10
  %51 = or i32 %50, %5
  %52 = icmp slt i32 %51, %0
  br i1 %52, label %53, label %60

53:                                               ; preds = %46
  %54 = zext i32 %51 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %2, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !5, !amdgpu.noclobber !9
  %57 = fmul contract double %56, %56
  %58 = fcmp contract ogt double %57, %47
  %59 = select i1 %58, double %57, double %47
  br label %60

60:                                               ; preds = %53, %46
  %61 = phi double [ %59, %53 ], [ %47, %46 ]
  %62 = shl i32 %48, 10
  %63 = or i32 %62, %5
  %64 = or i32 %63, 1024
  %65 = icmp slt i32 %64, %0
  br i1 %65, label %66, label %73

66:                                               ; preds = %60
  %67 = zext i32 %64 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !5, !amdgpu.noclobber !9
  %70 = fmul contract double %69, %69
  %71 = fcmp contract ogt double %70, %61
  %72 = select i1 %71, double %70, double %61
  br label %73

73:                                               ; preds = %66, %60
  %74 = phi double [ %72, %66 ], [ %61, %60 ]
  %75 = shl i32 %48, 10
  %76 = or i32 %75, %5
  %77 = or i32 %76, 2048
  %78 = icmp slt i32 %77, %0
  br i1 %78, label %79, label %86

79:                                               ; preds = %73
  %80 = zext i32 %77 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %2, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !5, !amdgpu.noclobber !9
  %83 = fmul contract double %82, %82
  %84 = fcmp contract ogt double %83, %74
  %85 = select i1 %84, double %83, double %74
  br label %86

86:                                               ; preds = %79, %73
  %87 = phi double [ %85, %79 ], [ %74, %73 ]
  %88 = shl i32 %48, 10
  %89 = or i32 %88, %5
  %90 = or i32 %89, 3072
  %91 = icmp slt i32 %90, %0
  br i1 %91, label %92, label %99

92:                                               ; preds = %86
  %93 = zext i32 %90 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %2, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !5, !amdgpu.noclobber !9
  %96 = fmul contract double %95, %95
  %97 = fcmp contract ogt double %96, %87
  %98 = select i1 %97, double %96, double %87
  br label %99

99:                                               ; preds = %92, %86
  %100 = phi double [ %98, %92 ], [ %87, %86 ]
  %101 = shl i32 %48, 10
  %102 = or i32 %101, %5
  %103 = or i32 %102, 4096
  %104 = icmp slt i32 %103, %0
  br i1 %104, label %105, label %112

105:                                              ; preds = %99
  %106 = zext i32 %103 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %2, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !5, !amdgpu.noclobber !9
  %109 = fmul contract double %108, %108
  %110 = fcmp contract ogt double %109, %100
  %111 = select i1 %110, double %109, double %100
  br label %112

112:                                              ; preds = %105, %99
  %113 = phi double [ %111, %105 ], [ %100, %99 ]
  %114 = shl i32 %48, 10
  %115 = or i32 %114, %5
  %116 = or i32 %115, 5120
  %117 = icmp slt i32 %116, %0
  br i1 %117, label %118, label %125

118:                                              ; preds = %112
  %119 = zext i32 %116 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %2, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !5, !amdgpu.noclobber !9
  %122 = fmul contract double %121, %121
  %123 = fcmp contract ogt double %122, %113
  %124 = select i1 %123, double %122, double %113
  br label %125

125:                                              ; preds = %118, %112
  %126 = phi double [ %124, %118 ], [ %113, %112 ]
  %127 = shl i32 %48, 10
  %128 = or i32 %127, %5
  %129 = or i32 %128, 6144
  %130 = icmp slt i32 %129, %0
  br i1 %130, label %131, label %138

131:                                              ; preds = %125
  %132 = zext i32 %129 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %2, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !5, !amdgpu.noclobber !9
  %135 = fmul contract double %134, %134
  %136 = fcmp contract ogt double %135, %126
  %137 = select i1 %136, double %135, double %126
  br label %138

138:                                              ; preds = %131, %125
  %139 = phi double [ %137, %131 ], [ %126, %125 ]
  %140 = shl i32 %48, 10
  %141 = or i32 %140, %5
  %142 = or i32 %141, 7168
  %143 = icmp slt i32 %142, %0
  br i1 %143, label %144, label %151

144:                                              ; preds = %138
  %145 = zext i32 %142 to i64
  %146 = getelementptr inbounds double, double addrspace(1)* %2, i64 %145
  %147 = load double, double addrspace(1)* %146, align 8, !tbaa !5, !amdgpu.noclobber !9
  %148 = fmul contract double %147, %147
  %149 = fcmp contract ogt double %148, %139
  %150 = select i1 %149, double %148, double %139
  br label %151

151:                                              ; preds = %144, %138
  %152 = phi double [ %150, %144 ], [ %139, %138 ]
  %153 = add nuw nsw i32 %48, 8
  %154 = add i32 %49, 8
  %155 = icmp eq i32 %154, %12
  br i1 %155, label %13, label %46, !llvm.loop !13

156:                                              ; preds = %169, %37
  %157 = icmp eq i32 %5, 0
  br i1 %157, label %171, label %173

158:                                              ; preds = %44, %169
  %159 = phi i32 [ %160, %169 ], [ %45, %44 ]
  %160 = lshr i32 %159, 1
  %161 = icmp ult i32 %5, %160
  br i1 %161, label %162, label %169

162:                                              ; preds = %158
  %163 = add nuw nsw i32 %160, %5
  %164 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ30gpu_calculate_force_square_maxiiPKdPdE14s_force_square, i32 0, i32 %163
  %165 = load double, double addrspace(3)* %164, align 8, !tbaa !5
  %166 = load double, double addrspace(3)* %6, align 8, !tbaa !5
  %167 = fcmp contract ogt double %165, %166
  br i1 %167, label %168, label %169

168:                                              ; preds = %162
  store double %165, double addrspace(3)* %6, align 8, !tbaa !5
  br label %169

169:                                              ; preds = %162, %168, %158
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %170 = icmp ult i32 %159, 4
  br i1 %170, label %156, label %158, !llvm.loop !15

171:                                              ; preds = %156
  %172 = load double, double addrspace(3)* getelementptr inbounds ([1024 x double], [1024 x double] addrspace(3)* @_ZZ30gpu_calculate_force_square_maxiiPKdPdE14s_force_square, i32 0, i32 0), align 16, !tbaa !5
  store double %172, double addrspace(1)* %3, align 8, !tbaa !5
  br label %173

173:                                              ; preds = %171, %156
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
