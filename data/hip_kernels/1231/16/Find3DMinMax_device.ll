; ModuleID = '../data/hip_kernels/1231/16/main.cu'
source_filename = "../data/hip_kernels/1231/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_Threshold = protected addrspace(4) externally_initialized global [2 x float] zeroinitializer, align 4
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data1 = internal unnamed_addr addrspace(3) global [384 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2 = internal unnamed_addr addrspace(3) global [384 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data3 = internal unnamed_addr addrspace(3) global [384 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin1 = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin2 = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin3 = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax1 = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax2 = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax3 = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([2 x float] addrspace(4)* @d_Threshold to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12Find3DMinMaxPiPfS0_S0_iii(i32 addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, 126
  %11 = add nsw i32 %10, 125
  %12 = add nsw i32 %10, %8
  %13 = add nsw i32 %12, -16
  %14 = add nsw i32 %4, -1
  %15 = tail call i32 @llvm.smin.i32(i32 %11, i32 %14)
  %16 = add nsw i32 %8, -15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = shl i32 %17, 5
  %19 = add i32 %18, -1
  %20 = add nsw i32 %6, -1
  %21 = icmp ugt i32 %8, 14
  %22 = icmp ult i32 %8, 128
  %23 = icmp ugt i32 %8, 125
  %24 = icmp sgt i32 %12, %15
  %25 = icmp slt i32 %12, 16
  %26 = icmp slt i32 %13, %4
  %27 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin1, i32 0, i32 %8
  %28 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin2, i32 0, i32 %8
  %29 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin3, i32 0, i32 %8
  %30 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax1, i32 0, i32 %8
  %31 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax2, i32 0, i32 %8
  %32 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax3, i32 0, i32 %8
  %33 = add nuw nsw i32 %8, 2
  %34 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin2, i32 0, i32 %33
  %35 = add nuw nsw i32 %8, 1
  %36 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin1, i32 0, i32 %35
  %37 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymin3, i32 0, i32 %35
  %38 = load float, float addrspace(4)* getelementptr inbounds ([2 x float], [2 x float] addrspace(4)* @d_Threshold, i64 0, i64 1), align 4
  %39 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax2, i32 0, i32 %33
  %40 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax1, i32 0, i32 %35
  %41 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5ymax3, i32 0, i32 %35
  %42 = load float, float addrspace(4)* getelementptr inbounds ([2 x float], [2 x float] addrspace(4)* @d_Threshold, i64 0, i64 0), align 4
  br label %47

43:                                               ; preds = %160
  %44 = icmp ult i32 %8, 126
  %45 = icmp slt i32 %12, %4
  %46 = select i1 %44, i1 %45, i1 false
  br i1 %46, label %167, label %172

47:                                               ; preds = %7, %160
  %48 = phi i32 [ %16, %7 ], [ %49, %160 ]
  %49 = phi i32 [ %16, %7 ], [ %83, %160 ]
  %50 = phi i32 [ 0, %7 ], [ %164, %160 ]
  %51 = phi i32 [ 0, %7 ], [ %161, %160 ]
  %52 = phi i32 [ 0, %7 ], [ %165, %160 ]
  %53 = lshr i32 %51, 1
  %54 = shl nsw i32 %50, 7
  %55 = add nsw i32 %54, %16
  %56 = add i32 %19, %52
  %57 = tail call i32 @llvm.smax.i32(i32 %56, i32 0)
  %58 = tail call i32 @llvm.smin.i32(i32 %57, i32 %20)
  %59 = mul nsw i32 %58, %5
  br i1 %21, label %60, label %82

60:                                               ; preds = %47
  br i1 %25, label %61, label %64

61:                                               ; preds = %60
  %62 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data1, i32 0, i32 %55
  store float 0.000000e+00, float addrspace(3)* %62, align 4, !tbaa !5
  %63 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %55
  store float 0.000000e+00, float addrspace(3)* %63, align 4, !tbaa !5
  br label %79

64:                                               ; preds = %60
  br i1 %26, label %68, label %65

65:                                               ; preds = %64
  %66 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data1, i32 0, i32 %55
  store float 0.000000e+00, float addrspace(3)* %66, align 4, !tbaa !5
  %67 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %55
  store float 0.000000e+00, float addrspace(3)* %67, align 4, !tbaa !5
  br label %79

68:                                               ; preds = %64
  %69 = add nsw i32 %59, %13
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data1, i32 0, i32 %55
  store float %72, float addrspace(3)* %73, align 4, !tbaa !5
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %55
  store float %75, float addrspace(3)* %76, align 4, !tbaa !5
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %70
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %79

79:                                               ; preds = %65, %68, %61
  %80 = phi float [ 0.000000e+00, %61 ], [ %78, %68 ], [ 0.000000e+00, %65 ]
  %81 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data3, i32 0, i32 %55
  store float %80, float addrspace(3)* %81, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %79, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = add nsw i32 %54, %8
  %84 = icmp ugt i32 %52, 1
  %85 = select i1 %84, i1 %22, i1 false
  br i1 %85, label %86, label %121

86:                                               ; preds = %82
  %87 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data1, i32 0, i32 %48
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %89 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data1, i32 0, i32 %49
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %91 = tail call float @llvm.minnum.f32(float %88, float %90)
  %92 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data1, i32 0, i32 %83
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %94 = tail call float @llvm.minnum.f32(float %91, float %93)
  %95 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %48
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !5
  %97 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %49
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %99 = tail call float @llvm.minnum.f32(float %96, float %98)
  %100 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %83
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %102 = tail call float @llvm.minnum.f32(float %99, float %101)
  %103 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data3, i32 0, i32 %48
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %105 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data3, i32 0, i32 %49
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %107 = tail call float @llvm.minnum.f32(float %104, float %106)
  %108 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data3, i32 0, i32 %83
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !5
  %110 = tail call float @llvm.minnum.f32(float %107, float %109)
  %111 = tail call float @llvm.maxnum.f32(float %88, float %90)
  %112 = tail call float @llvm.maxnum.f32(float %111, float %93)
  %113 = tail call float @llvm.maxnum.f32(float %96, float %98)
  %114 = tail call float @llvm.maxnum.f32(float %113, float %101)
  %115 = tail call float @llvm.maxnum.f32(float %104, float %106)
  %116 = tail call float @llvm.maxnum.f32(float %115, float %109)
  store float %94, float addrspace(3)* %27, align 4, !tbaa !5
  %117 = tail call float @llvm.minnum.f32(float %94, float %102)
  %118 = tail call float @llvm.minnum.f32(float %117, float %110)
  store float %118, float addrspace(3)* %28, align 4, !tbaa !5
  store float %110, float addrspace(3)* %29, align 4, !tbaa !5
  store float %112, float addrspace(3)* %30, align 4, !tbaa !5
  %119 = tail call float @llvm.maxnum.f32(float %112, float %114)
  %120 = tail call float @llvm.maxnum.f32(float %119, float %116)
  store float %120, float addrspace(3)* %31, align 4, !tbaa !5
  store float %116, float addrspace(3)* %32, align 4, !tbaa !5
  br label %121

121:                                              ; preds = %86, %82
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %122 = xor i1 %84, true
  %123 = select i1 %122, i1 true, i1 %23
  %124 = select i1 %123, i1 true, i1 %24
  br i1 %124, label %160, label %125

125:                                              ; preds = %121
  %126 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %127 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %128 = tail call float @llvm.minnum.f32(float %126, float %127)
  %129 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %130 = tail call float @llvm.minnum.f32(float %128, float %129)
  %131 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %132 = tail call float @llvm.minnum.f32(float %130, float %131)
  %133 = add nsw i32 %48, 1
  %134 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %136 = tail call float @llvm.minnum.f32(float %132, float %135)
  %137 = add nsw i32 %83, 1
  %138 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %137
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !5
  %140 = tail call float @llvm.minnum.f32(float %136, float %139)
  %141 = tail call float @llvm.minnum.f32(float %140, float %38)
  %142 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %143 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %144 = tail call float @llvm.maxnum.f32(float %142, float %143)
  %145 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %146 = tail call float @llvm.maxnum.f32(float %144, float %145)
  %147 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %148 = tail call float @llvm.maxnum.f32(float %146, float %147)
  %149 = tail call float @llvm.maxnum.f32(float %148, float %135)
  %150 = tail call float @llvm.maxnum.f32(float %149, float %139)
  %151 = tail call float @llvm.maxnum.f32(float %150, float %42)
  %152 = add nsw i32 %49, 1
  %153 = getelementptr inbounds [384 x float], [384 x float] addrspace(3)* @_ZZ12Find3DMinMaxPiPfS0_S0_iiiE5data2, i32 0, i32 %152
  %154 = load float, float addrspace(3)* %153, align 4, !tbaa !5
  %155 = fcmp contract olt float %154, %141
  %156 = fcmp contract ogt float %154, %151
  %157 = select i1 %155, i1 true, i1 %156
  %158 = or i32 %53, -2147483648
  %159 = select i1 %157, i32 %158, i32 %53
  br label %160

160:                                              ; preds = %125, %121
  %161 = phi i32 [ %159, %125 ], [ %53, %121 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %162 = icmp slt i32 %50, 2
  %163 = add nsw i32 %50, 1
  %164 = select i1 %162, i32 %163, i32 0
  %165 = add nuw nsw i32 %52, 1
  %166 = icmp eq i32 %165, 34
  br i1 %166, label %43, label %47, !llvm.loop !10

167:                                              ; preds = %43
  %168 = mul i32 %17, %5
  %169 = add i32 %168, %12
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %170
  store i32 %161, i32 addrspace(1)* %171, align 4, !tbaa !12
  br label %172

172:                                              ; preds = %167, %43
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
