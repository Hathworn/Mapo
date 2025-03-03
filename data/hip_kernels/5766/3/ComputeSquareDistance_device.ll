; ModuleID = '../data/hip_kernels/5766/3/main.cu'
source_filename = "../data/hip_kernels/5766/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21ComputeSquareDistancePfS_iiE6blockA = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ21ComputeSquareDistancePfS_iiE6blockB = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21ComputeSquareDistancePfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %11, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %17, %20
  %22 = icmp slt i32 %3, -14
  br i1 %22, label %66, label %23

23:                                               ; preds = %4
  %24 = add nsw i32 %3, -1
  %25 = sdiv i32 %24, 16
  %26 = icmp ult i32 %19, %2
  %27 = mul i32 %19, %3
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 %20, i32 %18
  %29 = icmp ult i32 %21, %2
  %30 = add i32 %17, %18
  %31 = mul i32 %30, %3
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 %20, i32 %18
  %33 = select i1 %26, i1 %29, i1 false
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 0, i32 %18
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 0, i32 %20
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 1, i32 %18
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 1, i32 %20
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 2, i32 %18
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 2, i32 %20
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 3, i32 %18
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 3, i32 %20
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 4, i32 %18
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 4, i32 %20
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 5, i32 %18
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 5, i32 %20
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 6, i32 %18
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 6, i32 %20
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 7, i32 %18
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 7, i32 %20
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 8, i32 %18
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 8, i32 %20
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 9, i32 %18
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 9, i32 %20
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 10, i32 %18
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 10, i32 %20
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 11, i32 %18
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 11, i32 %20
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 12, i32 %18
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 12, i32 %20
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 13, i32 %18
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 13, i32 %20
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 14, i32 %18
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 14, i32 %20
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockA, i32 0, i32 15, i32 %18
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21ComputeSquareDistancePfS_iiE6blockB, i32 0, i32 15, i32 %20
  br label %71

66:                                               ; preds = %171, %4
  %67 = phi float [ 0.000000e+00, %4 ], [ %172, %171 ]
  %68 = icmp ult i32 %19, %2
  %69 = icmp ult i32 %21, %2
  %70 = select i1 %68, i1 %69, i1 false
  br i1 %70, label %175, label %182

71:                                               ; preds = %23, %171
  %72 = phi float [ 0.000000e+00, %23 ], [ %172, %171 ]
  %73 = phi i32 [ 0, %23 ], [ %173, %171 ]
  %74 = shl nsw i32 %73, 4
  %75 = add nuw i32 %74, %20
  %76 = icmp ult i32 %75, %3
  br i1 %76, label %77, label %89

77:                                               ; preds = %71
  br i1 %26, label %78, label %83

78:                                               ; preds = %77
  %79 = add i32 %75, %27
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %82, float addrspace(3)* %28, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %78, %77
  br i1 %29, label %84, label %89

84:                                               ; preds = %83
  %85 = add i32 %75, %31
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %88, float addrspace(3)* %32, align 4, !tbaa !7
  br label %89

89:                                               ; preds = %83, %84, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %33, label %90, label %171

90:                                               ; preds = %89
  %91 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %92 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %93 = fsub contract float %91, %92
  %94 = fmul contract float %93, %93
  %95 = fadd contract float %72, %94
  %96 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %97 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %98 = fsub contract float %96, %97
  %99 = fmul contract float %98, %98
  %100 = fadd contract float %95, %99
  %101 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %102 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %103 = fsub contract float %101, %102
  %104 = fmul contract float %103, %103
  %105 = fadd contract float %100, %104
  %106 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %107 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %108 = fsub contract float %106, %107
  %109 = fmul contract float %108, %108
  %110 = fadd contract float %105, %109
  %111 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %112 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %113 = fsub contract float %111, %112
  %114 = fmul contract float %113, %113
  %115 = fadd contract float %110, %114
  %116 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %117 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %118 = fsub contract float %116, %117
  %119 = fmul contract float %118, %118
  %120 = fadd contract float %115, %119
  %121 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %122 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %123 = fsub contract float %121, %122
  %124 = fmul contract float %123, %123
  %125 = fadd contract float %120, %124
  %126 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %127 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %128 = fsub contract float %126, %127
  %129 = fmul contract float %128, %128
  %130 = fadd contract float %125, %129
  %131 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %132 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %133 = fsub contract float %131, %132
  %134 = fmul contract float %133, %133
  %135 = fadd contract float %130, %134
  %136 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %137 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %138 = fsub contract float %136, %137
  %139 = fmul contract float %138, %138
  %140 = fadd contract float %135, %139
  %141 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %142 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %143 = fsub contract float %141, %142
  %144 = fmul contract float %143, %143
  %145 = fadd contract float %140, %144
  %146 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %147 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %148 = fsub contract float %146, %147
  %149 = fmul contract float %148, %148
  %150 = fadd contract float %145, %149
  %151 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %152 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %153 = fsub contract float %151, %152
  %154 = fmul contract float %153, %153
  %155 = fadd contract float %150, %154
  %156 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %157 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %158 = fsub contract float %156, %157
  %159 = fmul contract float %158, %158
  %160 = fadd contract float %155, %159
  %161 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %162 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %163 = fsub contract float %161, %162
  %164 = fmul contract float %163, %163
  %165 = fadd contract float %160, %164
  %166 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %167 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %168 = fsub contract float %166, %167
  %169 = fmul contract float %168, %168
  %170 = fadd contract float %165, %169
  br label %171

171:                                              ; preds = %90, %89
  %172 = phi float [ %72, %89 ], [ %170, %90 ]
  %173 = add nuw nsw i32 %73, 1
  %174 = icmp eq i32 %73, %25
  br i1 %174, label %66, label %71, !llvm.loop !11

175:                                              ; preds = %66
  %176 = icmp eq i32 %19, %21
  %177 = select contract i1 %176, float 0x7FF0000000000000, float %67
  %178 = mul i32 %19, %2
  %179 = add i32 %178, %21
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  store float %177, float addrspace(1)* %181, align 4, !tbaa !7
  br label %182

182:                                              ; preds = %175, %66
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
