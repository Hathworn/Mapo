; ModuleID = '../data/hip_kernels/10738/5/main.cu'
source_filename = "../data/hip_kernels/10738/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12pi_optimizedPfS_PiE6counts = internal unnamed_addr addrspace(3) global [500 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12pi_optimizedPfS_Pi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  br label %16

13:                                               ; preds = %106
  %14 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %11
  store i32 %107, i32 addrspace(3)* %14, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %15 = icmp eq i32 %11, 0
  br i1 %15, label %113, label %217

16:                                               ; preds = %106, %3
  %17 = phi i32 [ 0, %3 ], [ %107, %106 ]
  %18 = phi i32 [ 0, %3 ], [ %108, %106 ]
  %19 = mul nuw nsw i32 %18, 100000
  %20 = add nsw i32 %12, %19
  %21 = icmp slt i32 %20, 100000000
  br i1 %21, label %22, label %34

22:                                               ; preds = %16
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
  %33 = add nsw i32 %17, %32
  br label %34

34:                                               ; preds = %22, %16
  %35 = phi i32 [ %17, %16 ], [ %33, %22 ]
  %36 = mul nuw i32 %18, 100000
  %37 = add nuw i32 %36, 100000
  %38 = add nsw i32 %12, %37
  %39 = icmp slt i32 %38, 100000000
  br i1 %39, label %40, label %52

40:                                               ; preds = %34
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !11, !amdgpu.noclobber !5
  %44 = fmul contract float %43, %43
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !11, !amdgpu.noclobber !5
  %47 = fmul contract float %46, %46
  %48 = fadd contract float %44, %47
  %49 = fcmp contract olt float %48, 1.000000e+00
  %50 = zext i1 %49 to i32
  %51 = add nsw i32 %35, %50
  br label %52

52:                                               ; preds = %40, %34
  %53 = phi i32 [ %35, %34 ], [ %51, %40 ]
  %54 = mul nuw i32 %18, 100000
  %55 = add nuw i32 %54, 200000
  %56 = add nsw i32 %12, %55
  %57 = icmp slt i32 %56, 100000000
  br i1 %57, label %58, label %70

58:                                               ; preds = %52
  %59 = sext i32 %56 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !5
  %62 = fmul contract float %61, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11, !amdgpu.noclobber !5
  %65 = fmul contract float %64, %64
  %66 = fadd contract float %62, %65
  %67 = fcmp contract olt float %66, 1.000000e+00
  %68 = zext i1 %67 to i32
  %69 = add nsw i32 %53, %68
  br label %70

70:                                               ; preds = %58, %52
  %71 = phi i32 [ %53, %52 ], [ %69, %58 ]
  %72 = mul nuw i32 %18, 100000
  %73 = add nuw i32 %72, 300000
  %74 = add nsw i32 %12, %73
  %75 = icmp slt i32 %74, 100000000
  br i1 %75, label %76, label %88

76:                                               ; preds = %70
  %77 = sext i32 %74 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11, !amdgpu.noclobber !5
  %80 = fmul contract float %79, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11, !amdgpu.noclobber !5
  %83 = fmul contract float %82, %82
  %84 = fadd contract float %80, %83
  %85 = fcmp contract olt float %84, 1.000000e+00
  %86 = zext i1 %85 to i32
  %87 = add nsw i32 %71, %86
  br label %88

88:                                               ; preds = %76, %70
  %89 = phi i32 [ %71, %70 ], [ %87, %76 ]
  %90 = mul nuw i32 %18, 100000
  %91 = add nuw i32 %90, 400000
  %92 = add nsw i32 %12, %91
  %93 = icmp slt i32 %92, 100000000
  br i1 %93, label %94, label %106

94:                                               ; preds = %88
  %95 = sext i32 %92 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11, !amdgpu.noclobber !5
  %98 = fmul contract float %97, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11, !amdgpu.noclobber !5
  %101 = fmul contract float %100, %100
  %102 = fadd contract float %98, %101
  %103 = fcmp contract olt float %102, 1.000000e+00
  %104 = zext i1 %103 to i32
  %105 = add nsw i32 %89, %104
  br label %106

106:                                              ; preds = %94, %88
  %107 = phi i32 [ %89, %88 ], [ %105, %94 ]
  %108 = add nuw nsw i32 %18, 5
  %109 = icmp eq i32 %108, 1000
  br i1 %109, label %13, label %16, !llvm.loop !13

110:                                              ; preds = %113
  %111 = zext i32 %4 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %111
  store i32 %214, i32 addrspace(1)* %112, align 4, !tbaa !7
  br label %217

113:                                              ; preds = %13, %113
  %114 = phi i32 [ %215, %113 ], [ 0, %13 ]
  %115 = phi i32 [ %214, %113 ], [ 0, %13 ]
  %116 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %114
  %117 = load i32, i32 addrspace(3)* %116, align 4, !tbaa !7
  %118 = add nsw i32 %117, %115
  %119 = add nuw nsw i32 %114, 1
  %120 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %119
  %121 = load i32, i32 addrspace(3)* %120, align 4, !tbaa !7
  %122 = add nsw i32 %121, %118
  %123 = add nuw nsw i32 %114, 2
  %124 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %123
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !7
  %126 = add nsw i32 %125, %122
  %127 = add nuw nsw i32 %114, 3
  %128 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %127
  %129 = load i32, i32 addrspace(3)* %128, align 4, !tbaa !7
  %130 = add nsw i32 %129, %126
  %131 = add nuw nsw i32 %114, 4
  %132 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %131
  %133 = load i32, i32 addrspace(3)* %132, align 4, !tbaa !7
  %134 = add nsw i32 %133, %130
  %135 = add nuw nsw i32 %114, 5
  %136 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %135
  %137 = load i32, i32 addrspace(3)* %136, align 4, !tbaa !7
  %138 = add nsw i32 %137, %134
  %139 = add nuw nsw i32 %114, 6
  %140 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %139
  %141 = load i32, i32 addrspace(3)* %140, align 4, !tbaa !7
  %142 = add nsw i32 %141, %138
  %143 = add nuw nsw i32 %114, 7
  %144 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %143
  %145 = load i32, i32 addrspace(3)* %144, align 4, !tbaa !7
  %146 = add nsw i32 %145, %142
  %147 = add nuw nsw i32 %114, 8
  %148 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %147
  %149 = load i32, i32 addrspace(3)* %148, align 4, !tbaa !7
  %150 = add nsw i32 %149, %146
  %151 = add nuw nsw i32 %114, 9
  %152 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %151
  %153 = load i32, i32 addrspace(3)* %152, align 4, !tbaa !7
  %154 = add nsw i32 %153, %150
  %155 = add nuw nsw i32 %114, 10
  %156 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %155
  %157 = load i32, i32 addrspace(3)* %156, align 4, !tbaa !7
  %158 = add nsw i32 %157, %154
  %159 = add nuw nsw i32 %114, 11
  %160 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %159
  %161 = load i32, i32 addrspace(3)* %160, align 4, !tbaa !7
  %162 = add nsw i32 %161, %158
  %163 = add nuw nsw i32 %114, 12
  %164 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %163
  %165 = load i32, i32 addrspace(3)* %164, align 4, !tbaa !7
  %166 = add nsw i32 %165, %162
  %167 = add nuw nsw i32 %114, 13
  %168 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %167
  %169 = load i32, i32 addrspace(3)* %168, align 4, !tbaa !7
  %170 = add nsw i32 %169, %166
  %171 = add nuw nsw i32 %114, 14
  %172 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %171
  %173 = load i32, i32 addrspace(3)* %172, align 4, !tbaa !7
  %174 = add nsw i32 %173, %170
  %175 = add nuw nsw i32 %114, 15
  %176 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %175
  %177 = load i32, i32 addrspace(3)* %176, align 4, !tbaa !7
  %178 = add nsw i32 %177, %174
  %179 = add nuw nsw i32 %114, 16
  %180 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %179
  %181 = load i32, i32 addrspace(3)* %180, align 4, !tbaa !7
  %182 = add nsw i32 %181, %178
  %183 = add nuw nsw i32 %114, 17
  %184 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %183
  %185 = load i32, i32 addrspace(3)* %184, align 4, !tbaa !7
  %186 = add nsw i32 %185, %182
  %187 = add nuw nsw i32 %114, 18
  %188 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %187
  %189 = load i32, i32 addrspace(3)* %188, align 4, !tbaa !7
  %190 = add nsw i32 %189, %186
  %191 = add nuw nsw i32 %114, 19
  %192 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %191
  %193 = load i32, i32 addrspace(3)* %192, align 4, !tbaa !7
  %194 = add nsw i32 %193, %190
  %195 = add nuw nsw i32 %114, 20
  %196 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %195
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !7
  %198 = add nsw i32 %197, %194
  %199 = add nuw nsw i32 %114, 21
  %200 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %199
  %201 = load i32, i32 addrspace(3)* %200, align 4, !tbaa !7
  %202 = add nsw i32 %201, %198
  %203 = add nuw nsw i32 %114, 22
  %204 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %203
  %205 = load i32, i32 addrspace(3)* %204, align 4, !tbaa !7
  %206 = add nsw i32 %205, %202
  %207 = add nuw nsw i32 %114, 23
  %208 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %207
  %209 = load i32, i32 addrspace(3)* %208, align 4, !tbaa !7
  %210 = add nsw i32 %209, %206
  %211 = add nuw nsw i32 %114, 24
  %212 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ12pi_optimizedPfS_PiE6counts, i32 0, i32 %211
  %213 = load i32, i32 addrspace(3)* %212, align 4, !tbaa !7
  %214 = add nsw i32 %213, %210
  %215 = add nuw nsw i32 %114, 25
  %216 = icmp eq i32 %215, 500
  br i1 %216, label %110, label %113, !llvm.loop !15

217:                                              ; preds = %110, %13
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
