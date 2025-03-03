; ModuleID = '../data/hip_kernels/13989/1/main.cu'
source_filename = "../data/hip_kernels/13989/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@data_in_shared = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18convolve_optimisedPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul nsw i32 %7, %4
  %9 = add nsw i32 %8, %6
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %0, i64 %10
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %6
  store float %12, float addrspace(3)* %13, align 4, !tbaa !5
  %14 = icmp eq i32 %6, 0
  %15 = icmp sgt i32 %3, 1
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %100

17:                                               ; preds = %5
  %18 = add i32 %3, -2
  %19 = add i32 %3, -1
  %20 = and i32 %19, 7
  %21 = icmp ult i32 %18, 7
  br i1 %21, label %85, label %22

22:                                               ; preds = %17
  %23 = and i32 %19, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %82, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %83, %24 ]
  %27 = add i32 %25, %4
  %28 = add i32 %27, %8
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %27
  store float %31, float addrspace(3)* %32, align 4, !tbaa !5
  %33 = or i32 %25, 1
  %34 = add i32 %33, %4
  %35 = add i32 %34, %8
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %34
  store float %38, float addrspace(3)* %39, align 4, !tbaa !5
  %40 = or i32 %25, 2
  %41 = add i32 %40, %4
  %42 = add i32 %41, %8
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %41
  store float %45, float addrspace(3)* %46, align 4, !tbaa !5
  %47 = or i32 %25, 3
  %48 = add i32 %47, %4
  %49 = add i32 %48, %8
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %48
  store float %52, float addrspace(3)* %53, align 4, !tbaa !5
  %54 = or i32 %25, 4
  %55 = add i32 %54, %4
  %56 = add i32 %55, %8
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %55
  store float %59, float addrspace(3)* %60, align 4, !tbaa !5
  %61 = or i32 %25, 5
  %62 = add i32 %61, %4
  %63 = add i32 %62, %8
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %62
  store float %66, float addrspace(3)* %67, align 4, !tbaa !5
  %68 = or i32 %25, 6
  %69 = add i32 %68, %4
  %70 = add i32 %69, %8
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %69
  store float %73, float addrspace(3)* %74, align 4, !tbaa !5
  %75 = or i32 %25, 7
  %76 = add i32 %75, %4
  %77 = add i32 %76, %8
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %76
  store float %80, float addrspace(3)* %81, align 4, !tbaa !5
  %82 = add nuw nsw i32 %25, 8
  %83 = add i32 %26, 8
  %84 = icmp eq i32 %83, %23
  br i1 %84, label %85, label %24, !llvm.loop !10

85:                                               ; preds = %24, %17
  %86 = phi i32 [ 0, %17 ], [ %82, %24 ]
  %87 = icmp eq i32 %20, 0
  br i1 %87, label %100, label %88

88:                                               ; preds = %85, %88
  %89 = phi i32 [ %97, %88 ], [ %86, %85 ]
  %90 = phi i32 [ %98, %88 ], [ 0, %85 ]
  %91 = add i32 %89, %4
  %92 = add i32 %91, %8
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %91
  store float %95, float addrspace(3)* %96, align 4, !tbaa !5
  %97 = add nuw nsw i32 %89, 1
  %98 = add i32 %90, 1
  %99 = icmp eq i32 %98, %20
  br i1 %99, label %100, label %88, !llvm.loop !12

100:                                              ; preds = %85, %88, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  store float 0.000000e+00, float addrspace(1)* %101, align 4, !tbaa !5
  %102 = icmp sgt i32 %3, 0
  br i1 %102, label %103, label %127

103:                                              ; preds = %100
  %104 = and i32 %3, 7
  %105 = icmp ult i32 %3, 8
  br i1 %105, label %108, label %106

106:                                              ; preds = %103
  %107 = and i32 %3, -8
  br label %128

108:                                              ; preds = %128, %103
  %109 = phi float [ 0.000000e+00, %103 ], [ %202, %128 ]
  %110 = phi i32 [ 0, %103 ], [ %203, %128 ]
  %111 = icmp eq i32 %104, 0
  br i1 %111, label %127, label %112

112:                                              ; preds = %108, %112
  %113 = phi float [ %123, %112 ], [ %109, %108 ]
  %114 = phi i32 [ %124, %112 ], [ %110, %108 ]
  %115 = phi i32 [ %125, %112 ], [ 0, %108 ]
  %116 = zext i32 %114 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5
  %119 = add nuw nsw i32 %114, %6
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %119
  %121 = load float, float addrspace(3)* %120, align 4, !tbaa !5
  %122 = fmul contract float %118, %121
  %123 = fadd contract float %113, %122
  store float %123, float addrspace(1)* %101, align 4, !tbaa !5
  %124 = add nuw nsw i32 %114, 1
  %125 = add i32 %115, 1
  %126 = icmp eq i32 %125, %104
  br i1 %126, label %127, label %112, !llvm.loop !14

127:                                              ; preds = %108, %112, %100
  ret void

128:                                              ; preds = %128, %106
  %129 = phi float [ 0.000000e+00, %106 ], [ %202, %128 ]
  %130 = phi i32 [ 0, %106 ], [ %203, %128 ]
  %131 = phi i32 [ 0, %106 ], [ %204, %128 ]
  %132 = zext i32 %130 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %2, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5
  %135 = add nuw nsw i32 %130, %6
  %136 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %135
  %137 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %138 = fmul contract float %134, %137
  %139 = fadd contract float %129, %138
  store float %139, float addrspace(1)* %101, align 4, !tbaa !5
  %140 = or i32 %130, 1
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %2, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5
  %144 = add nuw nsw i32 %140, %6
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %144
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %147 = fmul contract float %143, %146
  %148 = fadd contract float %139, %147
  store float %148, float addrspace(1)* %101, align 4, !tbaa !5
  %149 = or i32 %130, 2
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %2, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !5
  %153 = add nuw nsw i32 %149, %6
  %154 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %153
  %155 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %156 = fmul contract float %152, %155
  %157 = fadd contract float %148, %156
  store float %157, float addrspace(1)* %101, align 4, !tbaa !5
  %158 = or i32 %130, 3
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5
  %162 = add nuw nsw i32 %158, %6
  %163 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %162
  %164 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %165 = fmul contract float %161, %164
  %166 = fadd contract float %157, %165
  store float %166, float addrspace(1)* %101, align 4, !tbaa !5
  %167 = or i32 %130, 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %2, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5
  %171 = add nuw nsw i32 %167, %6
  %172 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %171
  %173 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %174 = fmul contract float %170, %173
  %175 = fadd contract float %166, %174
  store float %175, float addrspace(1)* %101, align 4, !tbaa !5
  %176 = or i32 %130, 5
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %2, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !5
  %180 = add nuw nsw i32 %176, %6
  %181 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %180
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %183 = fmul contract float %179, %182
  %184 = fadd contract float %175, %183
  store float %184, float addrspace(1)* %101, align 4, !tbaa !5
  %185 = or i32 %130, 6
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %2, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !5
  %189 = add nuw nsw i32 %185, %6
  %190 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %189
  %191 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %192 = fmul contract float %188, %191
  %193 = fadd contract float %184, %192
  store float %193, float addrspace(1)* %101, align 4, !tbaa !5
  %194 = or i32 %130, 7
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %2, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !5
  %198 = add nuw nsw i32 %194, %6
  %199 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @data_in_shared, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %201 = fmul contract float %197, %200
  %202 = fadd contract float %193, %201
  store float %202, float addrspace(1)* %101, align 4, !tbaa !5
  %203 = add nuw nsw i32 %130, 8
  %204 = add i32 %131, 8
  %205 = icmp eq i32 %204, %107
  br i1 %205, label %108, label %128, !llvm.loop !15
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !11}
