; ModuleID = '../data/hip_kernels/1753/3/main.cu'
source_filename = "../data/hip_kernels/1753/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7add_imgPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = ashr i32 %3, 1
  %10 = add nsw i32 %9, %8
  %11 = ashr i32 %4, 1
  %12 = add nsw i32 %11, %7
  %13 = shl nsw i32 %3, 1
  %14 = add nsw i32 %13, 2
  %15 = mul nsw i32 %12, %14
  %16 = add nsw i32 %10, %15
  %17 = icmp sgt i32 %5, 0
  br i1 %17, label %18, label %46

18:                                               ; preds = %6
  %19 = mul i32 %14, %4
  %20 = shl i32 %19, 1
  %21 = add i32 %5, -1
  %22 = lshr i32 %21, 1
  %23 = add nuw i32 %22, 1
  %24 = and i32 %23, 7
  %25 = icmp ult i32 %5, 15
  br i1 %25, label %28, label %26

26:                                               ; preds = %18
  %27 = and i32 %23, -8
  br label %59

28:                                               ; preds = %59, %18
  %29 = phi float [ undef, %18 ], [ %117, %59 ]
  %30 = phi i32 [ 0, %18 ], [ %118, %59 ]
  %31 = phi float [ 0.000000e+00, %18 ], [ %117, %59 ]
  %32 = icmp eq i32 %24, 0
  br i1 %32, label %46, label %33

33:                                               ; preds = %28, %33
  %34 = phi i32 [ %43, %33 ], [ %30, %28 ]
  %35 = phi float [ %42, %33 ], [ %31, %28 ]
  %36 = phi i32 [ %44, %33 ], [ 0, %28 ]
  %37 = mul i32 %20, %34
  %38 = add nsw i32 %37, %16
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = fadd contract float %35, %41
  %43 = add nuw nsw i32 %34, 2
  %44 = add i32 %36, 1
  %45 = icmp eq i32 %44, %24
  br i1 %45, label %46, label %33, !llvm.loop !10

46:                                               ; preds = %28, %33, %6
  %47 = phi float [ 0.000000e+00, %6 ], [ %29, %28 ], [ %42, %33 ]
  %48 = icmp sgt i32 %5, 1
  br i1 %48, label %49, label %139

49:                                               ; preds = %46
  %50 = mul i32 %14, %4
  %51 = shl i32 %50, 1
  %52 = add i32 %5, -2
  %53 = lshr i32 %52, 1
  %54 = add nuw i32 %53, 1
  %55 = and i32 %54, 7
  %56 = icmp ult i32 %52, 14
  br i1 %56, label %121, label %57

57:                                               ; preds = %49
  %58 = and i32 %54, -8
  br label %146

59:                                               ; preds = %59, %26
  %60 = phi i32 [ 0, %26 ], [ %118, %59 ]
  %61 = phi float [ 0.000000e+00, %26 ], [ %117, %59 ]
  %62 = phi i32 [ 0, %26 ], [ %119, %59 ]
  %63 = mul i32 %20, %60
  %64 = add nsw i32 %63, %16
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = fadd contract float %61, %67
  %69 = or i32 %60, 2
  %70 = mul i32 %20, %69
  %71 = add nsw i32 %70, %16
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = fadd contract float %68, %74
  %76 = or i32 %60, 4
  %77 = mul i32 %20, %76
  %78 = add nsw i32 %77, %16
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = fadd contract float %75, %81
  %83 = or i32 %60, 6
  %84 = mul i32 %20, %83
  %85 = add nsw i32 %84, %16
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = fadd contract float %82, %88
  %90 = or i32 %60, 8
  %91 = mul i32 %20, %90
  %92 = add nsw i32 %91, %16
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = fadd contract float %89, %95
  %97 = or i32 %60, 10
  %98 = mul i32 %20, %97
  %99 = add nsw i32 %98, %16
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = fadd contract float %96, %102
  %104 = or i32 %60, 12
  %105 = mul i32 %20, %104
  %106 = add nsw i32 %105, %16
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = fadd contract float %103, %109
  %111 = or i32 %60, 14
  %112 = mul i32 %20, %111
  %113 = add nsw i32 %112, %16
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = fadd contract float %110, %116
  %118 = add nuw nsw i32 %60, 16
  %119 = add i32 %62, 8
  %120 = icmp eq i32 %119, %27
  br i1 %120, label %28, label %59, !llvm.loop !12

121:                                              ; preds = %146, %49
  %122 = phi float [ undef, %49 ], [ %204, %146 ]
  %123 = phi i32 [ 1, %49 ], [ %205, %146 ]
  %124 = phi float [ 0.000000e+00, %49 ], [ %204, %146 ]
  %125 = icmp eq i32 %55, 0
  br i1 %125, label %139, label %126

126:                                              ; preds = %121, %126
  %127 = phi i32 [ %136, %126 ], [ %123, %121 ]
  %128 = phi float [ %135, %126 ], [ %124, %121 ]
  %129 = phi i32 [ %137, %126 ], [ 0, %121 ]
  %130 = mul i32 %51, %127
  %131 = add nsw i32 %130, %16
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  %135 = fadd contract float %128, %134
  %136 = add nuw nsw i32 %127, 2
  %137 = add i32 %129, 1
  %138 = icmp eq i32 %137, %55
  br i1 %138, label %139, label %126, !llvm.loop !14

139:                                              ; preds = %121, %126, %46
  %140 = phi float [ 0.000000e+00, %46 ], [ %122, %121 ], [ %135, %126 ]
  %141 = mul nsw i32 %7, %3
  %142 = add nsw i32 %141, %8
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  store float %47, float addrspace(1)* %144, align 4, !tbaa !5
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %143
  store float %140, float addrspace(1)* %145, align 4, !tbaa !5
  ret void

146:                                              ; preds = %146, %57
  %147 = phi i32 [ 1, %57 ], [ %205, %146 ]
  %148 = phi float [ 0.000000e+00, %57 ], [ %204, %146 ]
  %149 = phi i32 [ 0, %57 ], [ %206, %146 ]
  %150 = mul i32 %51, %147
  %151 = add nsw i32 %150, %16
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !5, !amdgpu.noclobber !9
  %155 = fadd contract float %148, %154
  %156 = add nuw nsw i32 %147, 2
  %157 = mul i32 %51, %156
  %158 = add nsw i32 %157, %16
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5, !amdgpu.noclobber !9
  %162 = fadd contract float %155, %161
  %163 = add nuw nsw i32 %147, 4
  %164 = mul i32 %51, %163
  %165 = add nsw i32 %164, %16
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !5, !amdgpu.noclobber !9
  %169 = fadd contract float %162, %168
  %170 = add nuw nsw i32 %147, 6
  %171 = mul i32 %51, %170
  %172 = add nsw i32 %171, %16
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !5, !amdgpu.noclobber !9
  %176 = fadd contract float %169, %175
  %177 = add nuw nsw i32 %147, 8
  %178 = mul i32 %51, %177
  %179 = add nsw i32 %178, %16
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !5, !amdgpu.noclobber !9
  %183 = fadd contract float %176, %182
  %184 = add nuw nsw i32 %147, 10
  %185 = mul i32 %51, %184
  %186 = add nsw i32 %185, %16
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !5, !amdgpu.noclobber !9
  %190 = fadd contract float %183, %189
  %191 = add nuw nsw i32 %147, 12
  %192 = mul i32 %51, %191
  %193 = add nsw i32 %192, %16
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %0, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !5, !amdgpu.noclobber !9
  %197 = fadd contract float %190, %196
  %198 = add nuw nsw i32 %147, 14
  %199 = mul i32 %51, %198
  %200 = add nsw i32 %199, %16
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !5, !amdgpu.noclobber !9
  %204 = fadd contract float %197, %203
  %205 = add nuw nsw i32 %147, 16
  %206 = add i32 %149, 8
  %207 = icmp eq i32 %206, %58
  br i1 %207, label %121, label %146, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !13}
