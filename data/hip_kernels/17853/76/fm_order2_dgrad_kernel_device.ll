; ModuleID = '../data/hip_kernels/17853/76/main.cu'
source_filename = "../data/hip_kernels/17853/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22fm_order2_dgrad_kernelPKfS0_Pfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp slt i32 %7, %5
  %10 = icmp slt i32 %8, %3
  %11 = select i1 %9, i1 %10, i1 false
  br i1 %11, label %12, label %207

12:                                               ; preds = %6
  %13 = mul i32 %8, %5
  %14 = mul i32 %13, %4
  %15 = add nsw i32 %14, %7
  %16 = icmp sgt i32 %4, 0
  br i1 %16, label %17, label %40

17:                                               ; preds = %12
  %18 = and i32 %4, 7
  %19 = icmp ult i32 %4, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %4, -8
  br label %51

22:                                               ; preds = %51, %17
  %23 = phi float [ undef, %17 ], [ %109, %51 ]
  %24 = phi float [ 0.000000e+00, %17 ], [ %109, %51 ]
  %25 = phi i32 [ 0, %17 ], [ %110, %51 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %40, label %27

27:                                               ; preds = %22, %27
  %28 = phi float [ %36, %27 ], [ %24, %22 ]
  %29 = phi i32 [ %37, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %38, %27 ], [ 0, %22 ]
  %31 = mul nsw i32 %29, %5
  %32 = add nsw i32 %31, %15
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fadd contract float %28, %35
  %37 = add nuw nsw i32 %29, 1
  %38 = add i32 %30, 1
  %39 = icmp eq i32 %38, %18
  br i1 %39, label %40, label %27, !llvm.loop !10

40:                                               ; preds = %22, %27, %12
  %41 = phi float [ 0.000000e+00, %12 ], [ %23, %22 ], [ %36, %27 ]
  %42 = add nsw i32 %13, %7
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %16, label %46, label %207

46:                                               ; preds = %40
  %47 = and i32 %4, 7
  %48 = icmp ult i32 %4, 8
  br i1 %48, label %190, label %49

49:                                               ; preds = %46
  %50 = and i32 %4, -8
  br label %113

51:                                               ; preds = %51, %20
  %52 = phi float [ 0.000000e+00, %20 ], [ %109, %51 ]
  %53 = phi i32 [ 0, %20 ], [ %110, %51 ]
  %54 = phi i32 [ 0, %20 ], [ %111, %51 ]
  %55 = mul nsw i32 %53, %5
  %56 = add nsw i32 %55, %15
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = fadd contract float %52, %59
  %61 = or i32 %53, 1
  %62 = mul nsw i32 %61, %5
  %63 = add nsw i32 %62, %15
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = fadd contract float %60, %66
  %68 = or i32 %53, 2
  %69 = mul nsw i32 %68, %5
  %70 = add nsw i32 %69, %15
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = fadd contract float %67, %73
  %75 = or i32 %53, 3
  %76 = mul nsw i32 %75, %5
  %77 = add nsw i32 %76, %15
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = fadd contract float %74, %80
  %82 = or i32 %53, 4
  %83 = mul nsw i32 %82, %5
  %84 = add nsw i32 %83, %15
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = fadd contract float %81, %87
  %89 = or i32 %53, 5
  %90 = mul nsw i32 %89, %5
  %91 = add nsw i32 %90, %15
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = fadd contract float %88, %94
  %96 = or i32 %53, 6
  %97 = mul nsw i32 %96, %5
  %98 = add nsw i32 %97, %15
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = fadd contract float %95, %101
  %103 = or i32 %53, 7
  %104 = mul nsw i32 %103, %5
  %105 = add nsw i32 %104, %15
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fadd contract float %102, %108
  %110 = add nuw nsw i32 %53, 8
  %111 = add i32 %54, 8
  %112 = icmp eq i32 %111, %21
  br i1 %112, label %22, label %51, !llvm.loop !12

113:                                              ; preds = %113, %49
  %114 = phi i32 [ 0, %49 ], [ %187, %113 ]
  %115 = phi i32 [ 0, %49 ], [ %188, %113 ]
  %116 = mul nsw i32 %114, %5
  %117 = add nsw i32 %116, %15
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = fsub contract float %41, %120
  %122 = fmul contract float %45, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  store float %122, float addrspace(1)* %123, align 4, !tbaa !5
  %124 = or i32 %114, 1
  %125 = mul nsw i32 %124, %5
  %126 = add nsw i32 %125, %15
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5
  %130 = fsub contract float %41, %129
  %131 = fmul contract float %45, %130
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %127
  store float %131, float addrspace(1)* %132, align 4, !tbaa !5
  %133 = or i32 %114, 2
  %134 = mul nsw i32 %133, %5
  %135 = add nsw i32 %134, %15
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5
  %139 = fsub contract float %41, %138
  %140 = fmul contract float %45, %139
  %141 = getelementptr inbounds float, float addrspace(1)* %2, i64 %136
  store float %140, float addrspace(1)* %141, align 4, !tbaa !5
  %142 = or i32 %114, 3
  %143 = mul nsw i32 %142, %5
  %144 = add nsw i32 %143, %15
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !5
  %148 = fsub contract float %41, %147
  %149 = fmul contract float %45, %148
  %150 = getelementptr inbounds float, float addrspace(1)* %2, i64 %145
  store float %149, float addrspace(1)* %150, align 4, !tbaa !5
  %151 = or i32 %114, 4
  %152 = mul nsw i32 %151, %5
  %153 = add nsw i32 %152, %15
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !5
  %157 = fsub contract float %41, %156
  %158 = fmul contract float %45, %157
  %159 = getelementptr inbounds float, float addrspace(1)* %2, i64 %154
  store float %158, float addrspace(1)* %159, align 4, !tbaa !5
  %160 = or i32 %114, 5
  %161 = mul nsw i32 %160, %5
  %162 = add nsw i32 %161, %15
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !5
  %166 = fsub contract float %41, %165
  %167 = fmul contract float %45, %166
  %168 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  store float %167, float addrspace(1)* %168, align 4, !tbaa !5
  %169 = or i32 %114, 6
  %170 = mul nsw i32 %169, %5
  %171 = add nsw i32 %170, %15
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !5
  %175 = fsub contract float %41, %174
  %176 = fmul contract float %45, %175
  %177 = getelementptr inbounds float, float addrspace(1)* %2, i64 %172
  store float %176, float addrspace(1)* %177, align 4, !tbaa !5
  %178 = or i32 %114, 7
  %179 = mul nsw i32 %178, %5
  %180 = add nsw i32 %179, %15
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %0, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !5
  %184 = fsub contract float %41, %183
  %185 = fmul contract float %45, %184
  %186 = getelementptr inbounds float, float addrspace(1)* %2, i64 %181
  store float %185, float addrspace(1)* %186, align 4, !tbaa !5
  %187 = add nuw nsw i32 %114, 8
  %188 = add i32 %115, 8
  %189 = icmp eq i32 %188, %50
  br i1 %189, label %190, label %113, !llvm.loop !14

190:                                              ; preds = %113, %46
  %191 = phi i32 [ 0, %46 ], [ %187, %113 ]
  %192 = icmp eq i32 %47, 0
  br i1 %192, label %207, label %193

193:                                              ; preds = %190, %193
  %194 = phi i32 [ %204, %193 ], [ %191, %190 ]
  %195 = phi i32 [ %205, %193 ], [ 0, %190 ]
  %196 = mul nsw i32 %194, %5
  %197 = add nsw i32 %196, %15
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !5
  %201 = fsub contract float %41, %200
  %202 = fmul contract float %45, %201
  %203 = getelementptr inbounds float, float addrspace(1)* %2, i64 %198
  store float %202, float addrspace(1)* %203, align 4, !tbaa !5
  %204 = add nuw nsw i32 %194, 1
  %205 = add i32 %195, 1
  %206 = icmp eq i32 %205, %47
  br i1 %206, label %207, label %193, !llvm.loop !15

207:                                              ; preds = %190, %193, %40, %6
  ret void
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
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !11}
