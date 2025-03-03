; ModuleID = '../data/hip_kernels/11810/51/main.cu'
source_filename = "../data/hip_kernels/11810/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21ConditionCFLKernel2D3PdS_S_S_S_Piiid(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readnone %3, double addrspace(1)* nocapture readnone %4, i32 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, double %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = sub i32 0, %17
  %19 = icmp eq i32 %10, %18
  br i1 %19, label %20, label %190

20:                                               ; preds = %9
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !6
  %23 = icmp sgt i32 %7, 2
  br i1 %23, label %24, label %48

24:                                               ; preds = %20
  %25 = add i32 %7, -2
  %26 = add i32 %7, -3
  %27 = and i32 %25, 7
  %28 = icmp ult i32 %26, 7
  br i1 %28, label %31, label %29

29:                                               ; preds = %24
  %30 = and i32 %25, -8
  br label %58

31:                                               ; preds = %58, %24
  %32 = phi double [ undef, %24 ], [ %108, %58 ]
  %33 = phi i32 [ 2, %24 ], [ %109, %58 ]
  %34 = phi double [ %22, %24 ], [ %108, %58 ]
  %35 = icmp eq i32 %27, 0
  br i1 %35, label %48, label %36

36:                                               ; preds = %31, %36
  %37 = phi i32 [ %45, %36 ], [ %33, %31 ]
  %38 = phi double [ %44, %36 ], [ %34, %31 ]
  %39 = phi i32 [ %46, %36 ], [ 0, %31 ]
  %40 = zext i32 %37 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !6
  %43 = fcmp contract olt double %42, %38
  %44 = select i1 %43, double %42, double %38
  %45 = add nuw nsw i32 %37, 1
  %46 = add i32 %39, 1
  %47 = icmp eq i32 %46, %27
  br i1 %47, label %48, label %36, !llvm.loop !11

48:                                               ; preds = %31, %36, %20
  %49 = phi double [ %22, %20 ], [ %32, %31 ], [ %44, %36 ]
  %50 = icmp sgt i32 %7, 1
  br i1 %50, label %51, label %129

51:                                               ; preds = %48
  %52 = add i32 %7, -2
  %53 = add i32 %7, -1
  %54 = and i32 %53, 7
  %55 = icmp ult i32 %52, 7
  br i1 %55, label %112, label %56

56:                                               ; preds = %51
  %57 = and i32 %53, -8
  br label %136

58:                                               ; preds = %58, %29
  %59 = phi i32 [ 2, %29 ], [ %109, %58 ]
  %60 = phi double [ %22, %29 ], [ %108, %58 ]
  %61 = phi i32 [ 0, %29 ], [ %110, %58 ]
  %62 = zext i32 %59 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !6
  %65 = fcmp contract olt double %64, %60
  %66 = select i1 %65, double %64, double %60
  %67 = or i32 %59, 1
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %0, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7, !amdgpu.noclobber !6
  %71 = fcmp contract olt double %70, %66
  %72 = select i1 %71, double %70, double %66
  %73 = add nuw nsw i32 %59, 2
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7, !amdgpu.noclobber !6
  %77 = fcmp contract olt double %76, %72
  %78 = select i1 %77, double %76, double %72
  %79 = add nuw nsw i32 %59, 3
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %0, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !7, !amdgpu.noclobber !6
  %83 = fcmp contract olt double %82, %78
  %84 = select i1 %83, double %82, double %78
  %85 = add nuw nsw i32 %59, 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !6
  %89 = fcmp contract olt double %88, %84
  %90 = select i1 %89, double %88, double %84
  %91 = add nuw nsw i32 %59, 5
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %0, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7, !amdgpu.noclobber !6
  %95 = fcmp contract olt double %94, %90
  %96 = select i1 %95, double %94, double %90
  %97 = add nuw nsw i32 %59, 6
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7, !amdgpu.noclobber !6
  %101 = fcmp contract olt double %100, %96
  %102 = select i1 %101, double %100, double %96
  %103 = add nuw nsw i32 %59, 7
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %0, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !7, !amdgpu.noclobber !6
  %107 = fcmp contract olt double %106, %102
  %108 = select i1 %107, double %106, double %102
  %109 = add nuw nsw i32 %59, 8
  %110 = add i32 %61, 8
  %111 = icmp eq i32 %110, %30
  br i1 %111, label %31, label %58, !llvm.loop !13

112:                                              ; preds = %136, %51
  %113 = phi double [ undef, %51 ], [ %186, %136 ]
  %114 = phi i32 [ 0, %51 ], [ %187, %136 ]
  %115 = phi double [ %49, %51 ], [ %186, %136 ]
  %116 = icmp eq i32 %54, 0
  br i1 %116, label %129, label %117

117:                                              ; preds = %112, %117
  %118 = phi i32 [ %126, %117 ], [ %114, %112 ]
  %119 = phi double [ %125, %117 ], [ %115, %112 ]
  %120 = phi i32 [ %127, %117 ], [ 0, %112 ]
  %121 = zext i32 %118 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %2, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7, !amdgpu.noclobber !6
  %124 = fcmp contract olt double %123, %119
  %125 = select i1 %124, double %123, double %119
  %126 = add nuw nsw i32 %118, 1
  %127 = add i32 %120, 1
  %128 = icmp eq i32 %127, %54
  br i1 %128, label %129, label %117, !llvm.loop !15

129:                                              ; preds = %112, %117, %48
  %130 = phi double [ %49, %48 ], [ %113, %112 ], [ %125, %117 ]
  %131 = fcmp contract ogt double %130, %8
  %132 = select i1 %131, double %8, double %130
  %133 = fdiv contract double %8, %132
  %134 = tail call double @llvm.ceil.f64(double %133)
  %135 = fptosi double %134 to i32
  store i32 %135, i32 addrspace(1)* %5, align 4, !tbaa !16
  br label %190

136:                                              ; preds = %136, %56
  %137 = phi i32 [ 0, %56 ], [ %187, %136 ]
  %138 = phi double [ %49, %56 ], [ %186, %136 ]
  %139 = phi i32 [ 0, %56 ], [ %188, %136 ]
  %140 = zext i32 %137 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %2, i64 %140
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !7, !amdgpu.noclobber !6
  %143 = fcmp contract olt double %142, %138
  %144 = select i1 %143, double %142, double %138
  %145 = or i32 %137, 1
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %2, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7, !amdgpu.noclobber !6
  %149 = fcmp contract olt double %148, %144
  %150 = select i1 %149, double %148, double %144
  %151 = or i32 %137, 2
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %2, i64 %152
  %154 = load double, double addrspace(1)* %153, align 8, !tbaa !7, !amdgpu.noclobber !6
  %155 = fcmp contract olt double %154, %150
  %156 = select i1 %155, double %154, double %150
  %157 = or i32 %137, 3
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds double, double addrspace(1)* %2, i64 %158
  %160 = load double, double addrspace(1)* %159, align 8, !tbaa !7, !amdgpu.noclobber !6
  %161 = fcmp contract olt double %160, %156
  %162 = select i1 %161, double %160, double %156
  %163 = or i32 %137, 4
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds double, double addrspace(1)* %2, i64 %164
  %166 = load double, double addrspace(1)* %165, align 8, !tbaa !7, !amdgpu.noclobber !6
  %167 = fcmp contract olt double %166, %162
  %168 = select i1 %167, double %166, double %162
  %169 = or i32 %137, 5
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds double, double addrspace(1)* %2, i64 %170
  %172 = load double, double addrspace(1)* %171, align 8, !tbaa !7, !amdgpu.noclobber !6
  %173 = fcmp contract olt double %172, %168
  %174 = select i1 %173, double %172, double %168
  %175 = or i32 %137, 6
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds double, double addrspace(1)* %2, i64 %176
  %178 = load double, double addrspace(1)* %177, align 8, !tbaa !7, !amdgpu.noclobber !6
  %179 = fcmp contract olt double %178, %174
  %180 = select i1 %179, double %178, double %174
  %181 = or i32 %137, 7
  %182 = zext i32 %181 to i64
  %183 = getelementptr inbounds double, double addrspace(1)* %2, i64 %182
  %184 = load double, double addrspace(1)* %183, align 8, !tbaa !7, !amdgpu.noclobber !6
  %185 = fcmp contract olt double %184, %180
  %186 = select i1 %185, double %184, double %180
  %187 = add nuw nsw i32 %137, 8
  %188 = add i32 %139, 8
  %189 = icmp eq i32 %188, %57
  br i1 %189, label %112, label %136, !llvm.loop !18

190:                                              ; preds = %129, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.ceil.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !9, i64 0}
!18 = distinct !{!18, !14}
