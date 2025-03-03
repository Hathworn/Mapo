; ModuleID = '../data/hip_kernels/10738/6/main.cu'
source_filename = "../data/hip_kernels/10738/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9pi_randomPfS_PiE6counts = internal unnamed_addr addrspace(3) global [500 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9pi_randomPfS_Pi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = mul nuw nsw i32 %11, 1000
  %13 = add i32 %10, %12
  br label %17

14:                                               ; preds = %102
  %15 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %11
  store i32 %103, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = icmp eq i32 %11, 0
  br i1 %16, label %109, label %213

17:                                               ; preds = %102, %3
  %18 = phi i32 [ 0, %3 ], [ %104, %102 ]
  %19 = phi i32 [ 0, %3 ], [ %103, %102 ]
  %20 = add nsw i32 %13, %18
  %21 = icmp slt i32 %20, 100000000
  br i1 %21, label %22, label %34

22:                                               ; preds = %17
  %23 = sext i32 %20 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !11, !amdgpu.noclobber !5
  %26 = fmul contract float %25, %25
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !11, !amdgpu.noclobber !5
  %29 = fmul contract float %28, %28
  %30 = fadd contract float %26, %29
  %31 = fcmp contract olt float %30, 1.000000e+00
  %32 = zext i1 %31 to i32
  %33 = add nsw i32 %19, %32
  br label %34

34:                                               ; preds = %22, %17
  %35 = phi i32 [ %19, %17 ], [ %33, %22 ]
  %36 = add nuw nsw i32 %18, 1
  %37 = add nsw i32 %13, %36
  %38 = icmp slt i32 %37, 100000000
  br i1 %38, label %39, label %51

39:                                               ; preds = %34
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !11, !amdgpu.noclobber !5
  %43 = fmul contract float %42, %42
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !11, !amdgpu.noclobber !5
  %46 = fmul contract float %45, %45
  %47 = fadd contract float %43, %46
  %48 = fcmp contract olt float %47, 1.000000e+00
  %49 = zext i1 %48 to i32
  %50 = add nsw i32 %35, %49
  br label %51

51:                                               ; preds = %39, %34
  %52 = phi i32 [ %35, %34 ], [ %50, %39 ]
  %53 = add nuw nsw i32 %18, 2
  %54 = add nsw i32 %13, %53
  %55 = icmp slt i32 %54, 100000000
  br i1 %55, label %56, label %68

56:                                               ; preds = %51
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11, !amdgpu.noclobber !5
  %60 = fmul contract float %59, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11, !amdgpu.noclobber !5
  %63 = fmul contract float %62, %62
  %64 = fadd contract float %60, %63
  %65 = fcmp contract olt float %64, 1.000000e+00
  %66 = zext i1 %65 to i32
  %67 = add nsw i32 %52, %66
  br label %68

68:                                               ; preds = %56, %51
  %69 = phi i32 [ %52, %51 ], [ %67, %56 ]
  %70 = add nuw nsw i32 %18, 3
  %71 = add nsw i32 %13, %70
  %72 = icmp slt i32 %71, 100000000
  br i1 %72, label %73, label %85

73:                                               ; preds = %68
  %74 = sext i32 %71 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11, !amdgpu.noclobber !5
  %77 = fmul contract float %76, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11, !amdgpu.noclobber !5
  %80 = fmul contract float %79, %79
  %81 = fadd contract float %77, %80
  %82 = fcmp contract olt float %81, 1.000000e+00
  %83 = zext i1 %82 to i32
  %84 = add nsw i32 %69, %83
  br label %85

85:                                               ; preds = %73, %68
  %86 = phi i32 [ %69, %68 ], [ %84, %73 ]
  %87 = add nuw nsw i32 %18, 4
  %88 = add nsw i32 %13, %87
  %89 = icmp slt i32 %88, 100000000
  br i1 %89, label %90, label %102

90:                                               ; preds = %85
  %91 = sext i32 %88 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !11, !amdgpu.noclobber !5
  %94 = fmul contract float %93, %93
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !11, !amdgpu.noclobber !5
  %97 = fmul contract float %96, %96
  %98 = fadd contract float %94, %97
  %99 = fcmp contract olt float %98, 1.000000e+00
  %100 = zext i1 %99 to i32
  %101 = add nsw i32 %86, %100
  br label %102

102:                                              ; preds = %90, %85
  %103 = phi i32 [ %86, %85 ], [ %101, %90 ]
  %104 = add nuw nsw i32 %18, 5
  %105 = icmp eq i32 %104, 1000
  br i1 %105, label %14, label %17, !llvm.loop !13

106:                                              ; preds = %109
  %107 = zext i32 %4 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %107
  store i32 %210, i32 addrspace(1)* %108, align 4, !tbaa !7
  br label %213

109:                                              ; preds = %14, %109
  %110 = phi i32 [ %211, %109 ], [ 0, %14 ]
  %111 = phi i32 [ %210, %109 ], [ 0, %14 ]
  %112 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %110
  %113 = load i32, i32 addrspace(3)* %112, align 4, !tbaa !7
  %114 = add nsw i32 %113, %111
  %115 = add nuw nsw i32 %110, 1
  %116 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %115
  %117 = load i32, i32 addrspace(3)* %116, align 4, !tbaa !7
  %118 = add nsw i32 %117, %114
  %119 = add nuw nsw i32 %110, 2
  %120 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %119
  %121 = load i32, i32 addrspace(3)* %120, align 4, !tbaa !7
  %122 = add nsw i32 %121, %118
  %123 = add nuw nsw i32 %110, 3
  %124 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %123
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !7
  %126 = add nsw i32 %125, %122
  %127 = add nuw nsw i32 %110, 4
  %128 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %127
  %129 = load i32, i32 addrspace(3)* %128, align 4, !tbaa !7
  %130 = add nsw i32 %129, %126
  %131 = add nuw nsw i32 %110, 5
  %132 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %131
  %133 = load i32, i32 addrspace(3)* %132, align 4, !tbaa !7
  %134 = add nsw i32 %133, %130
  %135 = add nuw nsw i32 %110, 6
  %136 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %135
  %137 = load i32, i32 addrspace(3)* %136, align 4, !tbaa !7
  %138 = add nsw i32 %137, %134
  %139 = add nuw nsw i32 %110, 7
  %140 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %139
  %141 = load i32, i32 addrspace(3)* %140, align 4, !tbaa !7
  %142 = add nsw i32 %141, %138
  %143 = add nuw nsw i32 %110, 8
  %144 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %143
  %145 = load i32, i32 addrspace(3)* %144, align 4, !tbaa !7
  %146 = add nsw i32 %145, %142
  %147 = add nuw nsw i32 %110, 9
  %148 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %147
  %149 = load i32, i32 addrspace(3)* %148, align 4, !tbaa !7
  %150 = add nsw i32 %149, %146
  %151 = add nuw nsw i32 %110, 10
  %152 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %151
  %153 = load i32, i32 addrspace(3)* %152, align 4, !tbaa !7
  %154 = add nsw i32 %153, %150
  %155 = add nuw nsw i32 %110, 11
  %156 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %155
  %157 = load i32, i32 addrspace(3)* %156, align 4, !tbaa !7
  %158 = add nsw i32 %157, %154
  %159 = add nuw nsw i32 %110, 12
  %160 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %159
  %161 = load i32, i32 addrspace(3)* %160, align 4, !tbaa !7
  %162 = add nsw i32 %161, %158
  %163 = add nuw nsw i32 %110, 13
  %164 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %163
  %165 = load i32, i32 addrspace(3)* %164, align 4, !tbaa !7
  %166 = add nsw i32 %165, %162
  %167 = add nuw nsw i32 %110, 14
  %168 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %167
  %169 = load i32, i32 addrspace(3)* %168, align 4, !tbaa !7
  %170 = add nsw i32 %169, %166
  %171 = add nuw nsw i32 %110, 15
  %172 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %171
  %173 = load i32, i32 addrspace(3)* %172, align 4, !tbaa !7
  %174 = add nsw i32 %173, %170
  %175 = add nuw nsw i32 %110, 16
  %176 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %175
  %177 = load i32, i32 addrspace(3)* %176, align 4, !tbaa !7
  %178 = add nsw i32 %177, %174
  %179 = add nuw nsw i32 %110, 17
  %180 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %179
  %181 = load i32, i32 addrspace(3)* %180, align 4, !tbaa !7
  %182 = add nsw i32 %181, %178
  %183 = add nuw nsw i32 %110, 18
  %184 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %183
  %185 = load i32, i32 addrspace(3)* %184, align 4, !tbaa !7
  %186 = add nsw i32 %185, %182
  %187 = add nuw nsw i32 %110, 19
  %188 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %187
  %189 = load i32, i32 addrspace(3)* %188, align 4, !tbaa !7
  %190 = add nsw i32 %189, %186
  %191 = add nuw nsw i32 %110, 20
  %192 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %191
  %193 = load i32, i32 addrspace(3)* %192, align 4, !tbaa !7
  %194 = add nsw i32 %193, %190
  %195 = add nuw nsw i32 %110, 21
  %196 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %195
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !7
  %198 = add nsw i32 %197, %194
  %199 = add nuw nsw i32 %110, 22
  %200 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %199
  %201 = load i32, i32 addrspace(3)* %200, align 4, !tbaa !7
  %202 = add nsw i32 %201, %198
  %203 = add nuw nsw i32 %110, 23
  %204 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %203
  %205 = load i32, i32 addrspace(3)* %204, align 4, !tbaa !7
  %206 = add nsw i32 %205, %202
  %207 = add nuw nsw i32 %110, 24
  %208 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ9pi_randomPfS_PiE6counts, i32 0, i32 %207
  %209 = load i32, i32 addrspace(3)* %208, align 4, !tbaa !7
  %210 = add nsw i32 %209, %206
  %211 = add nuw nsw i32 %110, 25
  %212 = icmp eq i32 %211, 500
  br i1 %212, label %106, label %109, !llvm.loop !15

213:                                              ; preds = %106, %14
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
