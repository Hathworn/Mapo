; ModuleID = '../data/hip_kernels/3265/62/main.cu'
source_filename = "../data/hip_kernels/3265/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7processiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #1 {
  %5 = alloca [12288 x float], align 16, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %188

16:                                               ; preds = %4
  %17 = bitcast [12288 x float] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 49152, i8 addrspace(5)* %17) #3
  %18 = mul nsw i32 %14, 12288
  br label %21

19:                                               ; preds = %21
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %124, label %120

21:                                               ; preds = %21, %16
  %22 = phi i32 [ 0, %16 ], [ %118, %21 ]
  %23 = add nsw i32 %22, %18
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %22
  store float %26, float addrspace(5)* %27, align 16, !tbaa !7
  %28 = or i32 %22, 1
  %29 = add nsw i32 %28, %18
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %28
  store float %32, float addrspace(5)* %33, align 4, !tbaa !7
  %34 = or i32 %22, 2
  %35 = add nsw i32 %34, %18
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %34
  store float %38, float addrspace(5)* %39, align 8, !tbaa !7
  %40 = or i32 %22, 3
  %41 = add nsw i32 %40, %18
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %40
  store float %44, float addrspace(5)* %45, align 4, !tbaa !7
  %46 = or i32 %22, 4
  %47 = add nsw i32 %46, %18
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %46
  store float %50, float addrspace(5)* %51, align 16, !tbaa !7
  %52 = or i32 %22, 5
  %53 = add nsw i32 %52, %18
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %52
  store float %56, float addrspace(5)* %57, align 4, !tbaa !7
  %58 = or i32 %22, 6
  %59 = add nsw i32 %58, %18
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %58
  store float %62, float addrspace(5)* %63, align 8, !tbaa !7
  %64 = or i32 %22, 7
  %65 = add nsw i32 %64, %18
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %64
  store float %68, float addrspace(5)* %69, align 4, !tbaa !7
  %70 = or i32 %22, 8
  %71 = add nsw i32 %70, %18
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %70
  store float %74, float addrspace(5)* %75, align 16, !tbaa !7
  %76 = or i32 %22, 9
  %77 = add nsw i32 %76, %18
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %76
  store float %80, float addrspace(5)* %81, align 4, !tbaa !7
  %82 = or i32 %22, 10
  %83 = add nsw i32 %82, %18
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %82
  store float %86, float addrspace(5)* %87, align 8, !tbaa !7
  %88 = or i32 %22, 11
  %89 = add nsw i32 %88, %18
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %88
  store float %92, float addrspace(5)* %93, align 4, !tbaa !7
  %94 = or i32 %22, 12
  %95 = add nsw i32 %94, %18
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %94
  store float %98, float addrspace(5)* %99, align 16, !tbaa !7
  %100 = or i32 %22, 13
  %101 = add nsw i32 %100, %18
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %100
  store float %104, float addrspace(5)* %105, align 4, !tbaa !7
  %106 = or i32 %22, 14
  %107 = add nsw i32 %106, %18
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %106
  store float %110, float addrspace(5)* %111, align 8, !tbaa !7
  %112 = or i32 %22, 15
  %113 = add nsw i32 %112, %18
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %112
  store float %116, float addrspace(5)* %117, align 4, !tbaa !7
  %118 = add nuw nsw i32 %22, 16
  %119 = icmp eq i32 %118, 12288
  br i1 %119, label %19, label %21, !llvm.loop !11

120:                                              ; preds = %124, %19
  %121 = phi float [ 0.000000e+00, %19 ], [ %186, %124 ]
  %122 = sext i32 %14 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %3, i64 %122
  store float %121, float addrspace(1)* %123, align 4, !tbaa !7
  call void @llvm.lifetime.end.p5i8(i64 49152, i8 addrspace(5)* %17) #3
  br label %188

124:                                              ; preds = %19, %124
  %125 = phi i32 [ %131, %124 ], [ 0, %19 ]
  %126 = phi float [ %186, %124 ], [ 0.000000e+00, %19 ]
  %127 = urem i32 %125, 12288
  %128 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %127
  %129 = load float, float addrspace(5)* %128, align 4, !tbaa !7
  %130 = fadd contract float %129, 0.000000e+00
  %131 = add nuw nsw i32 %125, 1
  %132 = urem i32 %131, 12288
  %133 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %132
  %134 = load float, float addrspace(5)* %133, align 4, !tbaa !7
  %135 = fadd contract float %130, %134
  %136 = add nuw nsw i32 %125, 2
  %137 = urem i32 %136, 12288
  %138 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %137
  %139 = load float, float addrspace(5)* %138, align 4, !tbaa !7
  %140 = fadd contract float %135, %139
  %141 = add nuw nsw i32 %125, 3
  %142 = urem i32 %141, 12288
  %143 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %142
  %144 = load float, float addrspace(5)* %143, align 4, !tbaa !7
  %145 = fadd contract float %140, %144
  %146 = add nuw nsw i32 %125, 4
  %147 = urem i32 %146, 12288
  %148 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %147
  %149 = load float, float addrspace(5)* %148, align 4, !tbaa !7
  %150 = fadd contract float %145, %149
  %151 = add nuw nsw i32 %125, 5
  %152 = urem i32 %151, 12288
  %153 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %152
  %154 = load float, float addrspace(5)* %153, align 4, !tbaa !7
  %155 = fadd contract float %150, %154
  %156 = add nuw nsw i32 %125, 6
  %157 = urem i32 %156, 12288
  %158 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %157
  %159 = load float, float addrspace(5)* %158, align 4, !tbaa !7
  %160 = fadd contract float %155, %159
  %161 = add nuw nsw i32 %125, 7
  %162 = urem i32 %161, 12288
  %163 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %162
  %164 = load float, float addrspace(5)* %163, align 4, !tbaa !7
  %165 = fadd contract float %160, %164
  %166 = add nuw nsw i32 %125, 8
  %167 = urem i32 %166, 12288
  %168 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %167
  %169 = load float, float addrspace(5)* %168, align 4, !tbaa !7
  %170 = fadd contract float %165, %169
  %171 = add nuw nsw i32 %125, 9
  %172 = urem i32 %171, 12288
  %173 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %172
  %174 = load float, float addrspace(5)* %173, align 4, !tbaa !7
  %175 = fadd contract float %170, %174
  %176 = add nuw nsw i32 %125, 10
  %177 = urem i32 %176, 12288
  %178 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %177
  %179 = load float, float addrspace(5)* %178, align 4, !tbaa !7
  %180 = fadd contract float %175, %179
  %181 = add nuw nsw i32 %125, 11
  %182 = urem i32 %181, 12288
  %183 = getelementptr inbounds [12288 x float], [12288 x float] addrspace(5)* %5, i32 0, i32 %182
  %184 = load float, float addrspace(5)* %183, align 4, !tbaa !7
  %185 = fadd contract float %180, %184
  %186 = fadd contract float %126, %185
  %187 = icmp eq i32 %131, %0
  br i1 %187, label %120, label %124, !llvm.loop !13

188:                                              ; preds = %4, %120
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

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
!13 = distinct !{!13, !12}
