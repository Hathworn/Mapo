; ModuleID = '../data/hip_kernels/336/0/main.cu'
source_filename = "../data/hip_kernels/336/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13matMultiply1DPfS_S_i(float addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #1 {
  %5 = alloca [2048 x float], align 16, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %215

16:                                               ; preds = %4
  %17 = bitcast [2048 x float] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8192, i8 addrspace(5)* %17) #3
  %18 = icmp eq i32 %3, 0
  br i1 %18, label %101, label %19

19:                                               ; preds = %16
  %20 = mul nsw i32 %14, %3
  %21 = and i32 %3, 7
  %22 = icmp ult i32 %3, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %19
  %24 = and i32 %3, -8
  br label %46

25:                                               ; preds = %46, %19
  %26 = phi i32 [ 0, %19 ], [ %96, %46 ]
  %27 = icmp eq i32 %21, 0
  br i1 %27, label %39, label %28

28:                                               ; preds = %25, %28
  %29 = phi i32 [ %36, %28 ], [ %26, %25 ]
  %30 = phi i32 [ %37, %28 ], [ 0, %25 ]
  %31 = add i32 %29, %20
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %29
  store float %34, float addrspace(5)* %35, align 4, !tbaa !7
  %36 = add nuw i32 %29, 1
  %37 = add i32 %30, 1
  %38 = icmp eq i32 %37, %21
  br i1 %38, label %39, label %28, !llvm.loop !11

39:                                               ; preds = %28, %25
  br i1 %18, label %101, label %40

40:                                               ; preds = %39
  %41 = mul nsw i32 %14, %3
  %42 = and i32 %3, 7
  %43 = icmp ult i32 %3, 8
  %44 = and i32 %3, -8
  %45 = icmp eq i32 %42, 0
  br label %99

46:                                               ; preds = %46, %23
  %47 = phi i32 [ 0, %23 ], [ %96, %46 ]
  %48 = phi i32 [ 0, %23 ], [ %97, %46 ]
  %49 = add i32 %47, %20
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %47
  store float %52, float addrspace(5)* %53, align 16, !tbaa !7
  %54 = or i32 %47, 1
  %55 = add i32 %54, %20
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %54
  store float %58, float addrspace(5)* %59, align 4, !tbaa !7
  %60 = or i32 %47, 2
  %61 = add i32 %60, %20
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %60
  store float %64, float addrspace(5)* %65, align 8, !tbaa !7
  %66 = or i32 %47, 3
  %67 = add i32 %66, %20
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %66
  store float %70, float addrspace(5)* %71, align 4, !tbaa !7
  %72 = or i32 %47, 4
  %73 = add i32 %72, %20
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %72
  store float %76, float addrspace(5)* %77, align 16, !tbaa !7
  %78 = or i32 %47, 5
  %79 = add i32 %78, %20
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %78
  store float %82, float addrspace(5)* %83, align 4, !tbaa !7
  %84 = or i32 %47, 6
  %85 = add i32 %84, %20
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !6
  %89 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %84
  store float %88, float addrspace(5)* %89, align 8, !tbaa !7
  %90 = or i32 %47, 7
  %91 = add i32 %90, %20
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !6
  %95 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %90
  store float %94, float addrspace(5)* %95, align 4, !tbaa !7
  %96 = add nuw i32 %47, 8
  %97 = add i32 %48, 8
  %98 = icmp eq i32 %97, %24
  br i1 %98, label %25, label %46, !llvm.loop !13

99:                                               ; preds = %40, %122
  %100 = phi i32 [ 0, %40 ], [ %127, %122 ]
  br i1 %43, label %102, label %129

101:                                              ; preds = %122, %16, %39
  call void @llvm.lifetime.end.p5i8(i64 8192, i8 addrspace(5)* %17) #3
  br label %215

102:                                              ; preds = %129, %99
  %103 = phi float [ undef, %99 ], [ %211, %129 ]
  %104 = phi i32 [ 0, %99 ], [ %212, %129 ]
  %105 = phi float [ 0.000000e+00, %99 ], [ %211, %129 ]
  br i1 %45, label %122, label %106

106:                                              ; preds = %102, %106
  %107 = phi i32 [ %119, %106 ], [ %104, %102 ]
  %108 = phi float [ %118, %106 ], [ %105, %102 ]
  %109 = phi i32 [ %120, %106 ], [ 0, %102 ]
  %110 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %107
  %111 = load float, float addrspace(5)* %110, align 4, !tbaa !7
  %112 = mul i32 %107, %3
  %113 = add i32 %112, %100
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fmul contract float %111, %116
  %118 = fadd contract float %108, %117
  %119 = add nuw i32 %107, 1
  %120 = add i32 %109, 1
  %121 = icmp eq i32 %120, %42
  br i1 %121, label %122, label %106, !llvm.loop !15

122:                                              ; preds = %106, %102
  %123 = phi float [ %103, %102 ], [ %118, %106 ]
  %124 = add i32 %100, %41
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  store float %123, float addrspace(1)* %126, align 4, !tbaa !7
  %127 = add nuw i32 %100, 1
  %128 = icmp eq i32 %127, %3
  br i1 %128, label %101, label %99, !llvm.loop !16

129:                                              ; preds = %99, %129
  %130 = phi i32 [ %212, %129 ], [ 0, %99 ]
  %131 = phi float [ %211, %129 ], [ 0.000000e+00, %99 ]
  %132 = phi i32 [ %213, %129 ], [ 0, %99 ]
  %133 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %130
  %134 = load float, float addrspace(5)* %133, align 16, !tbaa !7
  %135 = mul i32 %130, %3
  %136 = add i32 %135, %100
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = fmul contract float %134, %139
  %141 = fadd contract float %131, %140
  %142 = or i32 %130, 1
  %143 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %142
  %144 = load float, float addrspace(5)* %143, align 4, !tbaa !7
  %145 = mul i32 %142, %3
  %146 = add i32 %145, %100
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = fmul contract float %144, %149
  %151 = fadd contract float %141, %150
  %152 = or i32 %130, 2
  %153 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %152
  %154 = load float, float addrspace(5)* %153, align 8, !tbaa !7
  %155 = mul i32 %152, %3
  %156 = add i32 %155, %100
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %160 = fmul contract float %154, %159
  %161 = fadd contract float %151, %160
  %162 = or i32 %130, 3
  %163 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %162
  %164 = load float, float addrspace(5)* %163, align 4, !tbaa !7
  %165 = mul i32 %162, %3
  %166 = add i32 %165, %100
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7
  %170 = fmul contract float %164, %169
  %171 = fadd contract float %161, %170
  %172 = or i32 %130, 4
  %173 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %172
  %174 = load float, float addrspace(5)* %173, align 16, !tbaa !7
  %175 = mul i32 %172, %3
  %176 = add i32 %175, %100
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = fmul contract float %174, %179
  %181 = fadd contract float %171, %180
  %182 = or i32 %130, 5
  %183 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %182
  %184 = load float, float addrspace(5)* %183, align 4, !tbaa !7
  %185 = mul i32 %182, %3
  %186 = add i32 %185, %100
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %1, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7
  %190 = fmul contract float %184, %189
  %191 = fadd contract float %181, %190
  %192 = or i32 %130, 6
  %193 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %192
  %194 = load float, float addrspace(5)* %193, align 8, !tbaa !7
  %195 = mul i32 %192, %3
  %196 = add i32 %195, %100
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %1, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = fmul contract float %194, %199
  %201 = fadd contract float %191, %200
  %202 = or i32 %130, 7
  %203 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(5)* %5, i32 0, i32 %202
  %204 = load float, float addrspace(5)* %203, align 4, !tbaa !7
  %205 = mul i32 %202, %3
  %206 = add i32 %205, %100
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %1, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %210 = fmul contract float %204, %209
  %211 = fadd contract float %201, %210
  %212 = add nuw i32 %130, 8
  %213 = add i32 %132, 8
  %214 = icmp eq i32 %213, %44
  br i1 %214, label %102, label %129, !llvm.loop !17

215:                                              ; preds = %101, %4
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
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
