; ModuleID = '../data/hip_kernels/12063/7/main.cu'
source_filename = "../data/hip_kernels/12063/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16
@_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE3AUS = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33efficient_Kogge_Stone_scan_kernelPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = udiv i32 2047, %9
  %11 = add nuw nsw i32 %10, 1
  %12 = and i32 %11, 7
  %13 = icmp ugt i16 %8, 292
  br i1 %13, label %16, label %14

14:                                               ; preds = %3
  %15 = and i32 %11, -8
  br label %41

16:                                               ; preds = %41, %3
  %17 = phi i32 [ 0, %3 ], [ %91, %41 ]
  %18 = icmp eq i32 %12, 0
  br i1 %18, label %30, label %19

19:                                               ; preds = %16, %19
  %20 = phi i32 [ %27, %19 ], [ %17, %16 ]
  %21 = phi i32 [ %28, %19 ], [ 0, %16 ]
  %22 = add nuw nsw i32 %20, %4
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %22
  store float %25, float addrspace(3)* %26, align 4, !tbaa !7
  %27 = add nuw nsw i32 %20, %9
  %28 = add i32 %21, 1
  %29 = icmp eq i32 %28, %12
  br i1 %29, label %30, label %19, !llvm.loop !11

30:                                               ; preds = %19, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = shl nuw nsw i32 %4, 1
  %32 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %31
  %33 = load float, float addrspace(3)* %32, align 8, !tbaa !7
  %34 = add nuw nsw i32 %31, 1
  %35 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %34
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %37 = fadd contract float %33, %36
  store float %37, float addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %39 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE3AUS, i32 0, i32 %4
  store float %38, float addrspace(3)* %39, align 4, !tbaa !7
  %40 = icmp ugt i16 %8, 1
  br i1 %40, label %104, label %94

41:                                               ; preds = %41, %14
  %42 = phi i32 [ 0, %14 ], [ %91, %41 ]
  %43 = phi i32 [ 0, %14 ], [ %92, %41 ]
  %44 = add nuw nsw i32 %42, %4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %44
  store float %47, float addrspace(3)* %48, align 4, !tbaa !7
  %49 = add nuw nsw i32 %42, %9
  %50 = add nuw nsw i32 %49, %4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %50
  store float %53, float addrspace(3)* %54, align 4, !tbaa !7
  %55 = add nuw nsw i32 %49, %9
  %56 = add nuw nsw i32 %55, %4
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %56
  store float %59, float addrspace(3)* %60, align 4, !tbaa !7
  %61 = add nuw nsw i32 %55, %9
  %62 = add nuw nsw i32 %61, %4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %62
  store float %65, float addrspace(3)* %66, align 4, !tbaa !7
  %67 = add nuw nsw i32 %61, %9
  %68 = add nuw nsw i32 %67, %4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %68
  store float %71, float addrspace(3)* %72, align 4, !tbaa !7
  %73 = add nuw nsw i32 %67, %9
  %74 = add nuw nsw i32 %73, %4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %74
  store float %77, float addrspace(3)* %78, align 4, !tbaa !7
  %79 = add nuw nsw i32 %73, %9
  %80 = add nuw nsw i32 %79, %4
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  %84 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %80
  store float %83, float addrspace(3)* %84, align 4, !tbaa !7
  %85 = add nuw nsw i32 %79, %9
  %86 = add nuw nsw i32 %85, %4
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %86
  store float %89, float addrspace(3)* %90, align 4, !tbaa !7
  %91 = add nuw nsw i32 %85, %9
  %92 = add i32 %43, 8
  %93 = icmp eq i32 %92, %15
  br i1 %93, label %16, label %41, !llvm.loop !13

94:                                               ; preds = %117, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = icmp eq i32 %4, 0
  br i1 %95, label %120, label %96

96:                                               ; preds = %94
  %97 = add nsw i32 %4, -1
  %98 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE3AUS, i32 0, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %100 = load float, float addrspace(3)* %32, align 8, !tbaa !7
  %101 = fadd contract float %99, %100
  store float %101, float addrspace(3)* %32, align 8, !tbaa !7
  %102 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %103 = fadd contract float %99, %102
  store float %103, float addrspace(3)* %35, align 4, !tbaa !7
  br label %120

104:                                              ; preds = %30, %117
  %105 = phi i32 [ %118, %117 ], [ 1, %30 ]
  %106 = phi float [ %113, %117 ], [ undef, %30 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %107 = icmp ult i32 %4, %105
  br i1 %107, label %112, label %108

108:                                              ; preds = %104
  %109 = sub i32 %4, %105
  %110 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE3AUS, i32 0, i32 %109
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  br label %112

112:                                              ; preds = %108, %104
  %113 = phi float [ %111, %108 ], [ %106, %104 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %107, label %117, label %114

114:                                              ; preds = %112
  %115 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %116 = fadd contract float %113, %115
  store float %116, float addrspace(3)* %39, align 4, !tbaa !7
  br label %117

117:                                              ; preds = %112, %114
  %118 = shl i32 %105, 1
  %119 = icmp ult i32 %118, %9
  br i1 %119, label %104, label %94, !llvm.loop !15

120:                                              ; preds = %96, %94
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %121 = and i32 %11, 7
  %122 = icmp ugt i16 %8, 292
  br i1 %122, label %125, label %123

123:                                              ; preds = %120
  %124 = and i32 %11, -8
  br label %140

125:                                              ; preds = %140, %120
  %126 = phi i32 [ 0, %120 ], [ %190, %140 ]
  %127 = icmp eq i32 %121, 0
  br i1 %127, label %139, label %128

128:                                              ; preds = %125, %128
  %129 = phi i32 [ %136, %128 ], [ %126, %125 ]
  %130 = phi i32 [ %137, %128 ], [ 0, %125 ]
  %131 = add nuw nsw i32 %129, %4
  %132 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %131
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !7
  %134 = zext i32 %131 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  store float %133, float addrspace(1)* %135, align 4, !tbaa !7
  %136 = add nuw nsw i32 %129, %9
  %137 = add i32 %130, 1
  %138 = icmp eq i32 %137, %121
  br i1 %138, label %139, label %128, !llvm.loop !16

139:                                              ; preds = %128, %125
  ret void

140:                                              ; preds = %140, %123
  %141 = phi i32 [ 0, %123 ], [ %190, %140 ]
  %142 = phi i32 [ 0, %123 ], [ %191, %140 ]
  %143 = add nuw nsw i32 %141, %4
  %144 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %143
  %145 = load float, float addrspace(3)* %144, align 4, !tbaa !7
  %146 = zext i32 %143 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  store float %145, float addrspace(1)* %147, align 4, !tbaa !7
  %148 = add nuw nsw i32 %141, %9
  %149 = add nuw nsw i32 %148, %4
  %150 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %149
  %151 = load float, float addrspace(3)* %150, align 4, !tbaa !7
  %152 = zext i32 %149 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  store float %151, float addrspace(1)* %153, align 4, !tbaa !7
  %154 = add nuw nsw i32 %148, %9
  %155 = add nuw nsw i32 %154, %4
  %156 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %155
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !7
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  store float %157, float addrspace(1)* %159, align 4, !tbaa !7
  %160 = add nuw nsw i32 %154, %9
  %161 = add nuw nsw i32 %160, %4
  %162 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %161
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !7
  %164 = zext i32 %161 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  store float %163, float addrspace(1)* %165, align 4, !tbaa !7
  %166 = add nuw nsw i32 %160, %9
  %167 = add nuw nsw i32 %166, %4
  %168 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %167
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !7
  %170 = zext i32 %167 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  store float %169, float addrspace(1)* %171, align 4, !tbaa !7
  %172 = add nuw nsw i32 %166, %9
  %173 = add nuw nsw i32 %172, %4
  %174 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %173
  %175 = load float, float addrspace(3)* %174, align 4, !tbaa !7
  %176 = zext i32 %173 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %1, i64 %176
  store float %175, float addrspace(1)* %177, align 4, !tbaa !7
  %178 = add nuw nsw i32 %172, %9
  %179 = add nuw nsw i32 %178, %4
  %180 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %179
  %181 = load float, float addrspace(3)* %180, align 4, !tbaa !7
  %182 = zext i32 %179 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  store float %181, float addrspace(1)* %183, align 4, !tbaa !7
  %184 = add nuw nsw i32 %178, %9
  %185 = add nuw nsw i32 %184, %4
  %186 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ33efficient_Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %185
  %187 = load float, float addrspace(3)* %186, align 4, !tbaa !7
  %188 = zext i32 %185 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %1, i64 %188
  store float %187, float addrspace(1)* %189, align 4, !tbaa !7
  %190 = add nuw nsw i32 %184, %9
  %191 = add i32 %142, 8
  %192 = icmp eq i32 %191, %124
  br i1 %192, label %125, label %140, !llvm.loop !17
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
