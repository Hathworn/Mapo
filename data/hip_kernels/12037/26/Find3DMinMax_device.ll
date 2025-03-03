; ModuleID = '../data/hip_kernels/12037/26/main.cu'
source_filename = "../data/hip_kernels/12037/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_ConstantA = protected addrspace(4) externally_initialized global [8 x float] zeroinitializer, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data1 = internal unnamed_addr addrspace(3) global [390 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2 = internal unnamed_addr addrspace(3) global [390 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data3 = internal unnamed_addr addrspace(3) global [390 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin1 = internal unnamed_addr addrspace(3) global [130 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin2 = internal unnamed_addr addrspace(3) global [130 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin3 = internal unnamed_addr addrspace(3) global [130 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax1 = internal unnamed_addr addrspace(3) global [130 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax2 = internal unnamed_addr addrspace(3) global [130 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax3 = internal unnamed_addr addrspace(3) global [130 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([8 x float] addrspace(4)* @d_ConstantA to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12Find3DMinMaxPiPfS0_S0_ii(i32 addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 8
  %10 = ashr exact i32 %9, 1
  %11 = or i32 %10, 127
  %12 = add nsw i32 %10, %7
  %13 = add nsw i32 %12, -16
  %14 = add nsw i32 %4, -1
  %15 = tail call i32 @llvm.smin.i32(i32 %11, i32 %14)
  %16 = add nsw i32 %7, -15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = shl i32 %17, 5
  %19 = add i32 %18, -1
  %20 = add nsw i32 %5, -1
  %21 = shl i32 %4, 8
  %22 = ashr exact i32 %21, 8
  %23 = icmp ugt i32 %7, 14
  %24 = icmp ult i32 %7, 130
  %25 = icmp ugt i32 %7, 127
  %26 = icmp sgt i32 %12, %15
  %27 = icmp slt i32 %12, 16
  %28 = icmp slt i32 %13, %4
  %29 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin1, i32 0, i32 %7
  %30 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin2, i32 0, i32 %7
  %31 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin3, i32 0, i32 %7
  %32 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax1, i32 0, i32 %7
  %33 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax2, i32 0, i32 %7
  %34 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax3, i32 0, i32 %7
  %35 = add nuw nsw i32 %7, 2
  %36 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin2, i32 0, i32 %35
  %37 = add nuw nsw i32 %7, 1
  %38 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin1, i32 0, i32 %37
  %39 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymin3, i32 0, i32 %37
  %40 = load float, float addrspace(4)* getelementptr inbounds ([8 x float], [8 x float] addrspace(4)* @d_ConstantA, i64 0, i64 1), align 4
  %41 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax2, i32 0, i32 %35
  %42 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax1, i32 0, i32 %37
  %43 = getelementptr inbounds [130 x float], [130 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5ymax3, i32 0, i32 %37
  %44 = load float, float addrspace(4)* getelementptr inbounds ([8 x float], [8 x float] addrspace(4)* @d_ConstantA, i64 0, i64 0), align 16
  br label %49

45:                                               ; preds = %164
  %46 = icmp ult i32 %7, 128
  %47 = icmp slt i32 %12, %4
  %48 = select i1 %46, i1 %47, i1 false
  br i1 %48, label %171, label %178

49:                                               ; preds = %6, %164
  %50 = phi i32 [ %16, %6 ], [ %51, %164 ]
  %51 = phi i32 [ %16, %6 ], [ %87, %164 ]
  %52 = phi i32 [ 0, %6 ], [ %168, %164 ]
  %53 = phi i32 [ 0, %6 ], [ %165, %164 ]
  %54 = phi i32 [ 0, %6 ], [ %169, %164 ]
  %55 = lshr i32 %53, 1
  %56 = mul nsw i32 %52, 130
  %57 = add nsw i32 %56, %16
  %58 = add i32 %19, %54
  %59 = tail call i32 @llvm.smax.i32(i32 %58, i32 0)
  %60 = tail call i32 @llvm.smin.i32(i32 %59, i32 %20)
  %61 = shl i32 %60, 8
  %62 = ashr exact i32 %61, 8
  %63 = mul nsw i32 %62, %22
  br i1 %23, label %64, label %86

64:                                               ; preds = %49
  br i1 %27, label %65, label %68

65:                                               ; preds = %64
  %66 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data1, i32 0, i32 %57
  store float 0.000000e+00, float addrspace(3)* %66, align 4, !tbaa !5
  %67 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %57
  store float 0.000000e+00, float addrspace(3)* %67, align 4, !tbaa !5
  br label %83

68:                                               ; preds = %64
  br i1 %28, label %72, label %69

69:                                               ; preds = %68
  %70 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data1, i32 0, i32 %57
  store float 0.000000e+00, float addrspace(3)* %70, align 4, !tbaa !5
  %71 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %57
  store float 0.000000e+00, float addrspace(3)* %71, align 4, !tbaa !5
  br label %83

72:                                               ; preds = %68
  %73 = add nsw i32 %63, %13
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data1, i32 0, i32 %57
  store float %76, float addrspace(3)* %77, align 4, !tbaa !5
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %57
  store float %79, float addrspace(3)* %80, align 4, !tbaa !5
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %83

83:                                               ; preds = %69, %72, %65
  %84 = phi float [ 0.000000e+00, %65 ], [ %82, %72 ], [ 0.000000e+00, %69 ]
  %85 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data3, i32 0, i32 %57
  store float %84, float addrspace(3)* %85, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %83, %49
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = add nsw i32 %56, %7
  %88 = icmp ugt i32 %54, 1
  %89 = select i1 %88, i1 %24, i1 false
  br i1 %89, label %90, label %125

90:                                               ; preds = %86
  %91 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data1, i32 0, i32 %50
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %93 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data1, i32 0, i32 %51
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %95 = tail call float @llvm.minnum.f32(float %92, float %94)
  %96 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data1, i32 0, i32 %87
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %98 = tail call float @llvm.minnum.f32(float %95, float %97)
  %99 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %50
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !5
  %101 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %51
  %102 = load float, float addrspace(3)* %101, align 4, !tbaa !5
  %103 = tail call float @llvm.minnum.f32(float %100, float %102)
  %104 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %87
  %105 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %106 = tail call float @llvm.minnum.f32(float %103, float %105)
  %107 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data3, i32 0, i32 %50
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !5
  %109 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data3, i32 0, i32 %51
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %111 = tail call float @llvm.minnum.f32(float %108, float %110)
  %112 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data3, i32 0, i32 %87
  %113 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %114 = tail call float @llvm.minnum.f32(float %111, float %113)
  %115 = tail call float @llvm.maxnum.f32(float %92, float %94)
  %116 = tail call float @llvm.maxnum.f32(float %115, float %97)
  %117 = tail call float @llvm.maxnum.f32(float %100, float %102)
  %118 = tail call float @llvm.maxnum.f32(float %117, float %105)
  %119 = tail call float @llvm.maxnum.f32(float %108, float %110)
  %120 = tail call float @llvm.maxnum.f32(float %119, float %113)
  store float %98, float addrspace(3)* %29, align 4, !tbaa !5
  %121 = tail call float @llvm.minnum.f32(float %98, float %106)
  %122 = tail call float @llvm.minnum.f32(float %121, float %114)
  store float %122, float addrspace(3)* %30, align 4, !tbaa !5
  store float %114, float addrspace(3)* %31, align 4, !tbaa !5
  store float %116, float addrspace(3)* %32, align 4, !tbaa !5
  %123 = tail call float @llvm.maxnum.f32(float %116, float %118)
  %124 = tail call float @llvm.maxnum.f32(float %123, float %120)
  store float %124, float addrspace(3)* %33, align 4, !tbaa !5
  store float %120, float addrspace(3)* %34, align 4, !tbaa !5
  br label %125

125:                                              ; preds = %90, %86
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %126 = xor i1 %88, true
  %127 = select i1 %126, i1 true, i1 %25
  %128 = select i1 %127, i1 true, i1 %26
  br i1 %128, label %164, label %129

129:                                              ; preds = %125
  %130 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %131 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %132 = tail call float @llvm.minnum.f32(float %130, float %131)
  %133 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %134 = tail call float @llvm.minnum.f32(float %132, float %133)
  %135 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %136 = tail call float @llvm.minnum.f32(float %134, float %135)
  %137 = add nsw i32 %50, 1
  %138 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %137
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !5
  %140 = tail call float @llvm.minnum.f32(float %136, float %139)
  %141 = add nsw i32 %87, 1
  %142 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %141
  %143 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %144 = tail call float @llvm.minnum.f32(float %140, float %143)
  %145 = tail call float @llvm.minnum.f32(float %144, float %40)
  %146 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %147 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %148 = tail call float @llvm.maxnum.f32(float %146, float %147)
  %149 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %150 = tail call float @llvm.maxnum.f32(float %148, float %149)
  %151 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %152 = tail call float @llvm.maxnum.f32(float %150, float %151)
  %153 = tail call float @llvm.maxnum.f32(float %152, float %139)
  %154 = tail call float @llvm.maxnum.f32(float %153, float %143)
  %155 = tail call float @llvm.maxnum.f32(float %154, float %44)
  %156 = add nsw i32 %51, 1
  %157 = getelementptr inbounds [390 x float], [390 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiE5data2, i32 0, i32 %156
  %158 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %159 = fcmp contract olt float %158, %145
  %160 = fcmp contract ogt float %158, %155
  %161 = select i1 %159, i1 true, i1 %160
  %162 = or i32 %55, -2147483648
  %163 = select i1 %161, i32 %162, i32 %55
  br label %164

164:                                              ; preds = %129, %125
  %165 = phi i32 [ %163, %129 ], [ %55, %125 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %166 = icmp slt i32 %52, 2
  %167 = add nsw i32 %52, 1
  %168 = select i1 %166, i32 %167, i32 0
  %169 = add nuw nsw i32 %54, 1
  %170 = icmp eq i32 %169, 34
  br i1 %170, label %45, label %49, !llvm.loop !10

171:                                              ; preds = %45
  %172 = shl i32 %17, 8
  %173 = ashr exact i32 %172, 8
  %174 = mul nsw i32 %22, %173
  %175 = add nsw i32 %174, %12
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %176
  store i32 %165, i32 addrspace(1)* %177, align 4, !tbaa !12
  br label %178

178:                                              ; preds = %171, %45
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !7, i64 0}
