; ModuleID = '../data/hip_kernels/64/1/main.cu'
source_filename = "../data/hip_kernels/64/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_imin = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_jmin = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16
@_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_imax = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_jmax = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16
@_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE12_inputoffset = internal unnamed_addr addrspace(3) global [32 x [3 x i32]] undef, align 16
@_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE13_ksliceoffset = internal unnamed_addr addrspace(3) global [32 x [3 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %20, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %31 = getelementptr i8, i8 addrspace(4)* %21, i64 8
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 4, !range !4, !invariant.load !5
  %34 = zext i16 %33 to i32
  %35 = mul i32 %30, %34
  %36 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %37 = add i32 %35, %36
  %38 = icmp eq i32 %36, 0
  br i1 %38, label %39, label %87

39:                                               ; preds = %18
  %40 = add i32 %19, %2
  %41 = sub i32 %40, %4
  %42 = sdiv i32 %41, %2
  %43 = tail call i32 @llvm.smax.i32(i32 %42, i32 0)
  %44 = sub i32 %3, %5
  %45 = add i32 %44, %28
  %46 = sdiv i32 %45, %3
  %47 = tail call i32 @llvm.smax.i32(i32 %46, i32 0)
  %48 = sdiv i32 %19, %2
  %49 = icmp slt i32 %48, %6
  %50 = add nsw i32 %6, -1
  %51 = select i1 %49, i32 %48, i32 %50
  %52 = sdiv i32 %28, %3
  %53 = icmp slt i32 %52, %7
  %54 = add nsw i32 %7, -1
  %55 = select i1 %53, i32 %52, i32 %54
  %56 = icmp eq i32 %29, 0
  %57 = icmp eq i32 %27, 0
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %60

59:                                               ; preds = %39
  store i32 %43, i32 addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_imin, align 4, !tbaa !7
  store i32 %51, i32 addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_imax, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %59, %39
  br i1 %56, label %61, label %64

61:                                               ; preds = %60
  %62 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_jmin, i32 0, i32 %27
  store i32 %47, i32 addrspace(3)* %62, align 4, !tbaa !7
  %63 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_jmax, i32 0, i32 %27
  store i32 %55, i32 addrspace(3)* %63, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %61, %60
  %65 = mul i32 %35, %15
  %66 = sub nsw i32 %19, %13
  %67 = mul nsw i32 %66, %9
  %68 = sub i32 %67, %11
  %69 = add i32 %68, %28
  %70 = mul nsw i32 %69, %10
  %71 = add i32 %70, %65
  %72 = mul i32 %35, %16
  %73 = mul nsw i32 %43, %7
  %74 = add nsw i32 %73, %47
  %75 = mul nsw i32 %74, %4
  %76 = mul nsw i32 %43, %2
  %77 = sub i32 %19, %76
  %78 = add i32 %77, %75
  %79 = mul i32 %78, %5
  %80 = mul nsw i32 %47, %3
  %81 = sub i32 %28, %80
  %82 = add nsw i32 %81, %79
  %83 = mul nsw i32 %82, %10
  %84 = add i32 %83, %72
  %85 = getelementptr inbounds [32 x [3 x i32]], [32 x [3 x i32]] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE12_inputoffset, i32 0, i32 %27, i32 %29
  store i32 %71, i32 addrspace(3)* %85, align 4, !tbaa !7
  %86 = getelementptr inbounds [32 x [3 x i32]], [32 x [3 x i32]] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE13_ksliceoffset, i32 0, i32 %27, i32 %29
  store i32 %84, i32 addrspace(3)* %86, align 4, !tbaa !7
  br label %87

87:                                               ; preds = %64, %18
  %88 = phi i32 [ %43, %64 ], [ undef, %18 ]
  %89 = phi i32 [ %47, %64 ], [ undef, %18 ]
  %90 = phi i32 [ %51, %64 ], [ undef, %18 ]
  %91 = phi i32 [ %55, %64 ], [ undef, %18 ]
  %92 = phi i32 [ %71, %64 ], [ undef, %18 ]
  %93 = phi i32 [ %84, %64 ], [ undef, %18 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = icmp slt i32 %37, %17
  br i1 %94, label %95, label %173

95:                                               ; preds = %87
  %96 = add i32 %11, %9
  %97 = add nsw i32 %96, %12
  %98 = icmp slt i32 %28, %97
  br i1 %98, label %99, label %173

99:                                               ; preds = %95
  br i1 %38, label %111, label %100

100:                                              ; preds = %99
  %101 = load i32, i32 addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_imin, align 4, !tbaa !7
  %102 = load i32, i32 addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_imax, align 4, !tbaa !7
  %103 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_jmin, i32 0, i32 %27
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !7
  %105 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE5_jmax, i32 0, i32 %27
  %106 = load i32, i32 addrspace(3)* %105, align 4, !tbaa !7
  %107 = getelementptr inbounds [32 x [3 x i32]], [32 x [3 x i32]] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE12_inputoffset, i32 0, i32 %27, i32 %29
  %108 = load i32, i32 addrspace(3)* %107, align 4, !tbaa !7
  %109 = getelementptr inbounds [32 x [3 x i32]], [32 x [3 x i32]] addrspace(3)* @_ZZ21copyPixelsInSlicesRGBPfS_iiiiiiiiiiiiiiiiE13_ksliceoffset, i32 0, i32 %27, i32 %29
  %110 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !7
  br label %111

111:                                              ; preds = %100, %99
  %112 = phi i32 [ %101, %100 ], [ %88, %99 ]
  %113 = phi i32 [ %104, %100 ], [ %89, %99 ]
  %114 = phi i32 [ %102, %100 ], [ %90, %99 ]
  %115 = phi i32 [ %106, %100 ], [ %91, %99 ]
  %116 = phi i32 [ %108, %100 ], [ %92, %99 ]
  %117 = phi i32 [ %110, %100 ], [ %93, %99 ]
  %118 = mul i32 %36, %15
  %119 = add i32 %116, %118
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = mul i32 %36, %16
  %123 = add i32 %117, %122
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = mul nsw i32 %5, %4
  %127 = sub nsw i32 %126, %3
  %128 = mul nsw i32 %127, %10
  %129 = mul nsw i32 %7, %4
  %130 = sub nsw i32 %129, %2
  %131 = mul nsw i32 %130, %5
  %132 = mul nsw i32 %131, %10
  %133 = xor i32 %115, -1
  %134 = add i32 %113, %133
  %135 = mul i32 %134, %128
  %136 = add i32 %135, %132
  %137 = icmp slt i32 %19, %13
  br i1 %137, label %150, label %138

138:                                              ; preds = %111
  %139 = add nsw i32 %8, -1
  %140 = add nsw i32 %139, %13
  %141 = icmp sgt i32 %19, %140
  %142 = icmp slt i32 %28, %11
  %143 = select i1 %141, i1 true, i1 %142
  %144 = icmp sge i32 %28, %96
  %145 = select i1 %143, i1 true, i1 %144
  br i1 %145, label %150, label %146

146:                                              ; preds = %138
  %147 = zext i32 %29 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %121, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %150

150:                                              ; preds = %111, %138, %146
  %151 = phi float [ 0.000000e+00, %138 ], [ %149, %146 ], [ 0.000000e+00, %111 ]
  %152 = icmp sgt i32 %112, %114
  br i1 %152, label %173, label %153

153:                                              ; preds = %150
  %154 = icmp sgt i32 %113, %115
  %155 = zext i32 %29 to i64
  %156 = sext i32 %128 to i64
  %157 = sext i32 %136 to i64
  br label %158

158:                                              ; preds = %153, %168
  %159 = phi float addrspace(1)* [ %125, %153 ], [ %170, %168 ]
  %160 = phi i32 [ %112, %153 ], [ %171, %168 ]
  br i1 %154, label %168, label %161

161:                                              ; preds = %158, %161
  %162 = phi float addrspace(1)* [ %165, %161 ], [ %159, %158 ]
  %163 = phi i32 [ %166, %161 ], [ %113, %158 ]
  %164 = getelementptr inbounds float, float addrspace(1)* %162, i64 %155
  store float %151, float addrspace(1)* %164, align 4, !tbaa !11
  %165 = getelementptr inbounds float, float addrspace(1)* %162, i64 %156
  %166 = add nsw i32 %163, 1
  %167 = icmp slt i32 %163, %115
  br i1 %167, label %161, label %168, !llvm.loop !13

168:                                              ; preds = %161, %158
  %169 = phi float addrspace(1)* [ %159, %158 ], [ %165, %161 ]
  %170 = getelementptr inbounds float, float addrspace(1)* %169, i64 %157
  %171 = add nsw i32 %160, 1
  %172 = icmp slt i32 %160, %114
  br i1 %172, label %158, label %173, !llvm.loop !15

173:                                              ; preds = %168, %150, %95, %87
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
