; ModuleID = '../data/hip_kernels/9688/1/main.cu'
source_filename = "../data/hip_kernels/9688/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@XY = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26work_efficient_scan_kernelPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %19

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %11
  store i32 %17, i32 addrspace(3)* %18, align 4, !tbaa !7
  br label %19

19:                                               ; preds = %14, %3
  %20 = icmp ugt i16 %8, 1
  %21 = shl nuw nsw i32 %11, 1
  %22 = add nuw nsw i32 %21, 2
  br i1 %20, label %26, label %23

23:                                               ; preds = %38, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = shl nuw nsw i32 %22, 6
  %25 = icmp eq i32 %11, 0
  br i1 %25, label %41, label %49

26:                                               ; preds = %19, %38
  %27 = phi i32 [ %39, %38 ], [ 1, %19 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = mul i32 %27, %22
  %29 = add i32 %28, -1
  %30 = icmp ult i32 %29, %9
  br i1 %30, label %31, label %38

31:                                               ; preds = %26
  %32 = sub i32 %29, %27
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %32
  %34 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !7
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %29
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %37 = add nsw i32 %36, %34
  store i32 %37, i32 addrspace(3)* %35, align 4, !tbaa !7
  br label %38

38:                                               ; preds = %31, %26
  %39 = shl i32 %27, 1
  %40 = icmp ult i32 %39, %9
  br i1 %40, label %26, label %23, !llvm.loop !11

41:                                               ; preds = %23
  %42 = add nuw nsw i32 %24, 63
  %43 = add nsw i32 %24, -1
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %43
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !7
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %42
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = add nsw i32 %47, %45
  store i32 %48, i32 addrspace(3)* %46, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %41, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %50 = shl nuw nsw i32 %22, 5
  %51 = icmp ult i32 %11, 3
  br i1 %51, label %52, label %60

52:                                               ; preds = %49
  %53 = add nuw nsw i32 %50, 31
  %54 = add nsw i32 %50, -1
  %55 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %54
  %56 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !7
  %57 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %53
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = add nsw i32 %58, %56
  store i32 %59, i32 addrspace(3)* %57, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %52, %49
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = shl nuw nsw i32 %22, 4
  %62 = icmp ult i32 %11, 7
  br i1 %62, label %63, label %71

63:                                               ; preds = %60
  %64 = add nuw nsw i32 %61, 15
  %65 = add nsw i32 %61, -1
  %66 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %64
  %69 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !7
  %70 = add nsw i32 %69, %67
  store i32 %70, i32 addrspace(3)* %68, align 4, !tbaa !7
  br label %71

71:                                               ; preds = %63, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = shl nuw nsw i32 %22, 3
  %73 = icmp ult i32 %11, 15
  br i1 %73, label %74, label %82

74:                                               ; preds = %71
  %75 = add nuw nsw i32 %72, 7
  %76 = add nsw i32 %72, -1
  %77 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !7
  %79 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %75
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !7
  %81 = add nsw i32 %80, %78
  store i32 %81, i32 addrspace(3)* %79, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %74, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = shl nuw nsw i32 %22, 2
  %84 = icmp ult i32 %11, 31
  br i1 %84, label %85, label %93

85:                                               ; preds = %82
  %86 = add nuw nsw i32 %83, 3
  %87 = add nsw i32 %83, -1
  %88 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %87
  %89 = load i32, i32 addrspace(3)* %88, align 4, !tbaa !7
  %90 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %86
  %91 = load i32, i32 addrspace(3)* %90, align 4, !tbaa !7
  %92 = add nsw i32 %91, %89
  store i32 %92, i32 addrspace(3)* %90, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %85, %82
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = shl nuw nsw i32 %22, 1
  %95 = icmp ult i32 %11, 63
  br i1 %95, label %96, label %104

96:                                               ; preds = %93
  %97 = add nuw nsw i32 %94, 1
  %98 = add nsw i32 %94, -1
  %99 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !7
  %101 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %97
  %102 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !7
  %103 = add nsw i32 %102, %100
  store i32 %103, i32 addrspace(3)* %101, align 4, !tbaa !7
  br label %104

104:                                              ; preds = %96, %93
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = icmp ult i32 %11, 127
  br i1 %105, label %106, label %113

106:                                              ; preds = %104
  %107 = add nuw nsw i32 %21, 1
  %108 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %107
  %109 = load i32, i32 addrspace(3)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %22
  %111 = load i32, i32 addrspace(3)* %110, align 4, !tbaa !7
  %112 = add nsw i32 %111, %109
  store i32 %112, i32 addrspace(3)* %110, align 4, !tbaa !7
  br label %113

113:                                              ; preds = %106, %104
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %11
  %115 = load i32, i32 addrspace(3)* %114, align 4, !tbaa !7
  %116 = sext i32 %12 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  store i32 %115, i32 addrspace(1)* %117, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %118 = icmp ult i32 %11, %4
  br i1 %118, label %119, label %126

119:                                              ; preds = %113
  %120 = mul nuw nsw i32 %11, %9
  %121 = add nsw i32 %9, -1
  %122 = add nsw i32 %121, %120
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7
  store i32 %125, i32 addrspace(3)* %114, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %119, %113
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %127 = icmp eq i32 %4, 0
  br i1 %127, label %151, label %128

128:                                              ; preds = %126
  %129 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7
  %130 = and i32 %4, 7
  %131 = icmp ult i32 %4, 8
  br i1 %131, label %134, label %132

132:                                              ; preds = %128
  %133 = and i32 %4, -8
  br label %152

134:                                              ; preds = %152, %128
  %135 = phi i32 [ undef, %128 ], [ %186, %152 ]
  %136 = phi i32 [ %129, %128 ], [ %186, %152 ]
  %137 = phi i32 [ 0, %128 ], [ %187, %152 ]
  %138 = icmp eq i32 %130, 0
  br i1 %138, label %149, label %139

139:                                              ; preds = %134, %139
  %140 = phi i32 [ %145, %139 ], [ %136, %134 ]
  %141 = phi i32 [ %146, %139 ], [ %137, %134 ]
  %142 = phi i32 [ %147, %139 ], [ 0, %134 ]
  %143 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %141
  %144 = load i32, i32 addrspace(3)* %143, align 4, !tbaa !7
  %145 = add nsw i32 %140, %144
  %146 = add nuw i32 %141, 1
  %147 = add i32 %142, 1
  %148 = icmp eq i32 %147, %130
  br i1 %148, label %149, label %139, !llvm.loop !13

149:                                              ; preds = %139, %134
  %150 = phi i32 [ %135, %134 ], [ %145, %139 ]
  store i32 %150, i32 addrspace(1)* %117, align 4, !tbaa !7
  br label %151

151:                                              ; preds = %149, %126
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

152:                                              ; preds = %152, %132
  %153 = phi i32 [ %129, %132 ], [ %186, %152 ]
  %154 = phi i32 [ 0, %132 ], [ %187, %152 ]
  %155 = phi i32 [ 0, %132 ], [ %188, %152 ]
  %156 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %154
  %157 = load i32, i32 addrspace(3)* %156, align 4, !tbaa !7
  %158 = add nsw i32 %153, %157
  %159 = or i32 %154, 1
  %160 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %159
  %161 = load i32, i32 addrspace(3)* %160, align 4, !tbaa !7
  %162 = add nsw i32 %158, %161
  %163 = or i32 %154, 2
  %164 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %163
  %165 = load i32, i32 addrspace(3)* %164, align 4, !tbaa !7
  %166 = add nsw i32 %162, %165
  %167 = or i32 %154, 3
  %168 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %167
  %169 = load i32, i32 addrspace(3)* %168, align 4, !tbaa !7
  %170 = add nsw i32 %166, %169
  %171 = or i32 %154, 4
  %172 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %171
  %173 = load i32, i32 addrspace(3)* %172, align 4, !tbaa !7
  %174 = add nsw i32 %170, %173
  %175 = or i32 %154, 5
  %176 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %175
  %177 = load i32, i32 addrspace(3)* %176, align 4, !tbaa !7
  %178 = add nsw i32 %174, %177
  %179 = or i32 %154, 6
  %180 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %179
  %181 = load i32, i32 addrspace(3)* %180, align 4, !tbaa !7
  %182 = add nsw i32 %178, %181
  %183 = or i32 %154, 7
  %184 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %183
  %185 = load i32, i32 addrspace(3)* %184, align 4, !tbaa !7
  %186 = add nsw i32 %182, %185
  %187 = add nuw i32 %154, 8
  %188 = add i32 %155, 8
  %189 = icmp eq i32 %188, %133
  br i1 %189, label %134, label %152, !llvm.loop !15
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
